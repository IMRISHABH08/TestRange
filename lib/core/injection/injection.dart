import 'package:get_it/get_it.dart';

import '../../features/test_range/domain/usecase/test_range_usecase.dart';

// REGISTER-SERIVCES
void registerOnAppStartUpServices() {
  _registerServices();
}

//LIST ALL SERVICES TO BE REGISTERED
void _registerServices() {
  _initTestRange();
}

void _initTestRange() {
  GetIt.I.registerLazySingleton<TestRangeUsecase>(() => TestRangeUsecaseImpl());
}

//UN-REGISTER SERVICES
void unRegisterOnAppClosedServices() {
  _unRegisterServices();
}

//LIST ALL SERVICES TO BE UN-REGISTERED
void _unRegisterServices() {
  _unRegisterTestRange();
}

void _unRegisterTestRange() {
  _unregister<TestRangeUsecase>();
}

void _unregister<T extends Object>({String? instanceName}) {
  if (GetIt.I.isRegistered<T>(instanceName: instanceName)) {
    GetIt.I.unregister<T>(instanceName: instanceName);
  }
}
