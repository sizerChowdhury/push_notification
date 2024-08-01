abstract class SendPushNotificationRepo {
  void requestNotificationPermission();

  Future<void> setupInteractMessage();

  Future<String?> getDeviceToken();
}
