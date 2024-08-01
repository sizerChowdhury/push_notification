abstract class PushNotificationDataSource {
  void requestNotificationPermission();

  Future<void> setupInteractMessage();

  Future<String?> getDeviceToken();
}
