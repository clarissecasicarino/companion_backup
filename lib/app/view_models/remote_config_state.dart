import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/exception.dart';
import '../models/remote_config.dart';

part 'remote_config_state.freezed.dart';

@freezed
class RemoteConfigState with _$RemoteConfigState {
  const factory RemoteConfigState.initial() = _Initial;
  const factory RemoteConfigState.loading() = _Loading;
  const factory RemoteConfigState.remoteConfig(RemoteConfig remoteConfig) =
      _RemoteConfig;
  const factory RemoteConfigState.error(ShopSMException error) = _Error;
}

extension RemoteConfigStateX on RemoteConfigState {
  RemoteConfig? get config =>
      maybeWhen(remoteConfig: (r) => r, orElse: () => null);
}
