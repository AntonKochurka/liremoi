import 'package:get_it/get_it.dart';
import 'package:liremoi/core/database.dart';

final sl = GetIt.instance;

void initDI() {
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
}
