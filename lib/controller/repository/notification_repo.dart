class NotificationRepository {
  // Add your methods and properties here
  static String notificationList = "/notifications";
  static String getNotificationList({required int userId}) {
    return '$notificationList/$userId';
  }
  static String patchNotification({required int notifyId}) {
    return '$notificationList/$notifyId/read';
  }
  static String patchMarkAllRead({required int userId}) {
    return '$notificationList/$userId/read-all';
  }
  static String deleteNotification({required int notifyId}) {
    return '$notificationList/$notifyId';
  }
}