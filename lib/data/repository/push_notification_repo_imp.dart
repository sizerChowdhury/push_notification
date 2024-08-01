import 'package:notification/data/data_source/push_notification_data_source.dart';
import 'package:notification/domain/repository/send_push_notification_repo.dart';

class PushNotificationRepoImp implements SendPushNotificationRepo {
  final PushNotificationDataSource _pushNotificationDataSource;

  PushNotificationRepoImp(this._pushNotificationDataSource);

  @override
  void requestNotificationPermission() {
    _pushNotificationDataSource.requestNotificationPermission();
  }

  @override
  Future<String?> getDeviceToken() async{
    return await _pushNotificationDataSource.getDeviceToken();
  }

  @override
  Future<void> setupInteractMessage() async {
    return await _pushNotificationDataSource.setupInteractMessage();
  }
}
