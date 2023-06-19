import 'dart:async';

import 'package:ShopSM/app/models/remote_config.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remoteConfigRepository = Provider<RemoteConfigRepository>(
    (ref) => RemoteConfigRepositoryImpl(FirebaseRemoteConfig.instance));

abstract class RemoteConfigRepository {
  Future<void> init();
  Stream<RemoteConfig> get onConfigUpdated;
}

class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  final controller = StreamController<RemoteConfig>.broadcast();
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigRepositoryImpl(this._remoteConfig);

  @override
  Future<void> init() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(minutes: 1),
      minimumFetchInterval: const Duration(seconds: 1),
    ));
    // Only fetch after a delay to prevent an internal bug from occurring
    // See https://github.com/FirebaseExtended/flutterfire/issues/6196
    await Future.delayed(const Duration(seconds: 1));
    await _remoteConfig.fetchAndActivate();

    var values = _remoteConfig.getAll();
    controller.add(RemoteConfig(
        forceUpdateVersion: values["force_update_version"]?.asInt() ?? 1,
        maintenance: values["maintenance"]?.asBool() ?? false,
        tncVersion: values["tnc_version"]?.asInt() ?? 1));

    _remoteConfig.onConfigUpdated.listen((event) async {
      await _remoteConfig.activate();
      var v = _remoteConfig.getAll();
      print(v["maintenance"]?.asBool().toString());
      controller.add(RemoteConfig(
          forceUpdateVersion: v["force_update_version"]?.asInt() ?? 1,
          maintenance: v["maintenance"]?.asBool() ?? false,
          tncVersion: v["tnc_version"]?.asInt() ?? 1));
    });
  }

  @override
  Stream<RemoteConfig> get onConfigUpdated {
    return controller.stream.asBroadcastStream();
  }
}
