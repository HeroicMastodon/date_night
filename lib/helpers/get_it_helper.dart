import 'package:get_it/get_it.dart';

T getIt<T extends Object>() {
  return GetIt.I.get<T>();
}