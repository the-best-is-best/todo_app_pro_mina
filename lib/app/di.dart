import 'package:get_it/get_it.dart';
import 'package:todo_app_pro_mina/services/init_sqlite.dart';
import 'package:todo_app_pro_mina/services/notification_services.dart';

final di = GetIt.instance;

Future<void> initAppModels() async {
  di.registerFactory(() => SqfliteInit());
  await di<SqfliteInit>().initDatabase();
  await di.unregister<SqfliteInit>();
  di.registerFactory(() => NotificationServices());
}
