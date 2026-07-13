package com.clinician.app

import android.annotation.SuppressLint
import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log
import com.google.firebase.messaging.FirebaseMessagingService
import com.google.firebase.messaging.RemoteMessage
import com.hiennv.flutter_callkit_incoming.CallkitConstants
import com.hiennv.flutter_callkit_incoming.CallkitEventCallback
import com.hiennv.flutter_callkit_incoming.CallkitIncomingActivity
import com.hiennv.flutter_callkit_incoming.CallkitNotificationManager
import com.hiennv.flutter_callkit_incoming.CallkitSoundPlayerManager
import com.hiennv.flutter_callkit_incoming.Data
import com.hiennv.flutter_callkit_incoming.FlutterCallkitIncomingPlugin
import com.hiennv.flutter_callkit_incoming.addCall
import com.hiennv.flutter_callkit_incoming.removeAllCalls

class MyFirebaseMessagingService : FirebaseMessagingService() {

    companion object {
        private const val TAG = "MyFCMService"

        @Volatile
        private var activeSoundManager: CallkitSoundPlayerManager? = null

        private val callEventCallback = object : CallkitEventCallback {
            override fun onCallEvent(event: CallkitEventCallback.CallEvent, callData: Bundle) {
                activeSoundManager?.stop()
                activeSoundManager = null
            }
        }

        init {
            FlutterCallkitIncomingPlugin.registerEventCallback(callEventCallback)
        }
    }

    /**
     * Called for EVERY FCM message before Android decides whether to show a system notification.
     * This intercepts notification+data messages in background/killed state — where
     * onMessageReceived is never called — and routes call-type messages to our own handler.
     * Not calling super for call types prevents the system notification from appearing.
     */
    override fun handleIntent(intent: Intent) {
        val extras = intent.extras
        val type = extras?.getString("type") ?: ""
        Log.d(TAG, "handleIntent: type=$type")

        when (type) {
            "CALL_INCOMING", "CALL_MISSED", "CALL_ENDED", "CALL_DECLINED" -> {
                val data = mutableMapOf<String, String>()
                extras?.keySet()?.forEach { key ->
                    extras.getString(key)?.let { data[key] = it }
                }
                handleCallData(type, data)
                // Do NOT call super — prevents Android from showing its own plain notification
            }
            else -> super.handleIntent(intent)
        }
    }

    /** Fallback for pure data-only FCM messages (no notification block). */
    override fun onMessageReceived(remoteMessage: RemoteMessage) {
        val data = remoteMessage.data
        val type = data["type"] ?: ""
        Log.d(TAG, "onMessageReceived: type=$type")

        when (type) {
            "CALL_INCOMING", "CALL_MISSED", "CALL_ENDED", "CALL_DECLINED" ->
                handleCallData(type, data)
            else ->
                super.onMessageReceived(remoteMessage)
        }
    }

    @SuppressLint("MissingPermission")
    private fun handleCallData(type: String, data: Map<String, String>) {
        when (type) {
            "CALL_INCOMING" -> {
                if (isAppInForeground()) {
                    Log.d(TAG, "App in foreground — Flutter overlay will handle it")
                    return
                }

                val callId     = data["callId"]       ?: ""
                val callerName = data["callerName"]   ?: "Unknown"
                val avatar     = data["contactImage"] ?: ""
                val isVideoStr = data["isVideo"]      ?: "false"
                val isVideo    = isVideoStr == "true"

                val extra = hashMapOf<String, Any?>(
                    "callId"  to callId,
                    "isVideo" to isVideoStr
                )

                val bundle = Bundle().apply {
                    putString(CallkitConstants.EXTRA_CALLKIT_ID,          callId)
                    putString(CallkitConstants.EXTRA_CALLKIT_NAME_CALLER, callerName)
                    putString(CallkitConstants.EXTRA_CALLKIT_APP_NAME,    "Symmetry CareGiver")
                    putString(CallkitConstants.EXTRA_CALLKIT_AVATAR,      avatar)
                    putInt   (CallkitConstants.EXTRA_CALLKIT_TYPE,        if (isVideo) 1 else 0)
                    putLong  (CallkitConstants.EXTRA_CALLKIT_DURATION,    30000L)
                    putString(CallkitConstants.EXTRA_CALLKIT_TEXT_ACCEPT,  "Accept")
                    putString(CallkitConstants.EXTRA_CALLKIT_TEXT_DECLINE, "Decline")
                    putBoolean(CallkitConstants.EXTRA_CALLKIT_IS_CUSTOM_NOTIFICATION,     true)
                    putBoolean(CallkitConstants.EXTRA_CALLKIT_IS_SHOW_LOGO,               false)
                    putBoolean(CallkitConstants.EXTRA_CALLKIT_IS_SHOW_FULL_LOCKED_SCREEN, true)
                    putBoolean(CallkitConstants.EXTRA_CALLKIT_IS_IMPORTANT,               true)
                    putString(CallkitConstants.EXTRA_CALLKIT_BACKGROUND_COLOR, "#0F1D2D")
                    putString(CallkitConstants.EXTRA_CALLKIT_ACTION_COLOR,     "#4CAF50")
                    putString(CallkitConstants.EXTRA_CALLKIT_TEXT_COLOR,       "#FFFFFF")
                    putString(CallkitConstants.EXTRA_CALLKIT_RINGTONE_PATH, "incommingcall")
                    putString(
                        CallkitConstants.EXTRA_CALLKIT_INCOMING_CALL_NOTIFICATION_CHANNEL_NAME,
                        "Incoming Calls"
                    )
                    putString(CallkitConstants.EXTRA_CALLKIT_ACTION_FROM, "notification")
                    putSerializable(CallkitConstants.EXTRA_CALLKIT_EXTRA,   extra)
                    putSerializable(CallkitConstants.EXTRA_CALLKIT_HEADERS, hashMapOf<String, Any?>())
                    putString(CallkitConstants.EXTRA_CALLKIT_LOGO_URL,      "")
                    putString(CallkitConstants.EXTRA_CALLKIT_BACKGROUND_URL,"")
                    putBoolean(CallkitConstants.EXTRA_CALLKIT_MISSED_CALL_SHOW, true)
                    putInt(CallkitConstants.EXTRA_CALLKIT_MISSED_CALL_COUNT, 1)
                }

                // Persist call so Accept/Decline PendingIntents can retrieve call data
                addCall(applicationContext, Data.fromBundle(bundle))

                // Show notification — creates the channel first then shows with fullScreenIntent
                // pointing to CallkitIncomingActivity (triggers on locked screen automatically)
                val soundManager = CallkitSoundPlayerManager(applicationContext)
                activeSoundManager = soundManager
                val notifManager = CallkitNotificationManager(applicationContext, soundManager)
                notifManager.showIncomingNotification(bundle)
                Log.d(TAG, "Callkit notification shown for callId=$callId")

                // Also directly launch CallkitIncomingActivity for unlocked screens.
                // FCM background services are granted a brief window to start activities.
                try {
                    val activityIntent = CallkitIncomingActivity.getIntent(applicationContext, bundle)
                    activityIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    startActivity(activityIntent)
                    Log.d(TAG, "CallkitIncomingActivity launched directly")
                } catch (e: Exception) {
                    Log.w(TAG, "Could not start CallkitIncomingActivity: ${e.message}")
                    // Notification with fullScreenIntent is already shown above — it will
                    // launch the activity when the user interacts with it or when screen is locked
                }
            }

            "CALL_MISSED", "CALL_ENDED", "CALL_DECLINED" -> {
                if (isAppInForeground()) {
                    Log.d(TAG, "App in foreground — Flutter listener will handle dismissal")
                    return
                }

                activeSoundManager?.stop()
                activeSoundManager = null

                val callId = data["callId"] ?: ""
                val bundle = Bundle().apply {
                    putString(CallkitConstants.EXTRA_CALLKIT_ID, callId)
                    putSerializable(CallkitConstants.EXTRA_CALLKIT_EXTRA,   hashMapOf<String, Any?>())
                    putSerializable(CallkitConstants.EXTRA_CALLKIT_HEADERS, hashMapOf<String, Any?>())
                }
                val soundManager = CallkitSoundPlayerManager(applicationContext)
                val notifManager = CallkitNotificationManager(applicationContext, soundManager)
                notifManager.clearIncomingNotification(bundle, false)
                removeAllCalls(applicationContext)
                Log.d(TAG, "Callkit notification cleared for callId=$callId")
            }
        }
    }

    private fun isAppInForeground(): Boolean {
        val am = getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        return am.runningAppProcesses?.any {
            it.importance == ActivityManager.RunningAppProcessInfo.IMPORTANCE_FOREGROUND &&
            it.processName == packageName
        } == true
    }
}
