import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../network/network_info.dart' as _i4;
import 'modules/external_module.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final externalModule = _$ExternalModule();
  gh.singleton<_i3.Connectivity>(externalModule.connectivity);
  gh.singleton<_i4.NetworkInfo>(_i4.NetworkInfoImpl(get<_i3.Connectivity>()));
  return get;
}

class _$ExternalModule extends _i5.ExternalModule {}
