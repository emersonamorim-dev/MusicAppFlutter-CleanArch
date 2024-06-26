import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ExternalModule {
  @singleton
  Connectivity get connectivity => Connectivity();
}
