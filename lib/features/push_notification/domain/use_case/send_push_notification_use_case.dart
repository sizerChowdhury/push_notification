import 'package:notification/features/push_notification/domain/repository/send_push_notification_repo.dart';

class SendPushNotificationUseCase {
  final SendPushNotificationRepo _sendPushNotificationRepo;

  SendPushNotificationUseCase(this._sendPushNotificationRepo);

  void requestNotificationPermission() {
    _sendPushNotificationRepo.requestNotificationPermission();
  }

  Future<void> setupInteractMessage() async {
    return await _sendPushNotificationRepo.setupInteractMessage();
  }

  Future<String?> getDeviceToken() async {
    return await _sendPushNotificationRepo.getDeviceToken();
  }
}
