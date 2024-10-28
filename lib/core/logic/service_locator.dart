import 'package:app/core/logic/dio_helper.dart';
import 'package:get_it/get_it.dart';

void initServiceLocator() {
  final container = GetIt.instance;
  container.registerSingleton(DioHelper());
  // container.registerFactory(() => LoginCubit(GetIt.instance<DioHelper>()));
  // container.registerFactory(() => ForgetPasswordCubit(GetIt.instance<DioHelper>()));
  // container.registerFactory(() => HomeCubit(GetIt.instance<DioHelper>())..getData());
  // container.registerFactory(() => ShoppingAppCubit(GetIt.instance<DioHelper>())..getData());
}
