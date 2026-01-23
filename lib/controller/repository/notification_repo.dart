class NotificationRepository {
  // Add your methods and properties here
  static String notificationList = "/notifications";
  static String getNotificationList({required int userId}) {
    return '$notificationList/$userId';
  }
}