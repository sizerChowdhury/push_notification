import 'package:get_it/get_it.dart';
import 'package:notification/data/data_source/firebase_push_notification_data_source.dart';
import 'package:notification/data/data_source/push_notification_data_source.dart';
import 'package:notification/data/repository/push_notification_repo_imp.dart';
import 'package:notification/domain/repository/send_push_notification_repo.dart';
import 'package:notification/domain/use_case/send_push_notification_use_case.dart';

final serviceLocator = GetIt.instance;

void setUp() {
  serviceLocator.registerLazySingleton<SendPushNotificationUseCase>(() =>
      SendPushNotificationUseCase(serviceLocator<SendPushNotificationRepo>()));
  serviceLocator.registerLazySingleton<SendPushNotificationRepo>(
      () => PushNotificationRepoImp(FirebasePushNotificationDataSource()));
  serviceLocator.registerFactory<PushNotificationDataSource>(
          () => FirebasePushNotificationDataSource());
}
