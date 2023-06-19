import 'package:ShopSM/app/repositories/remote_config_repository.dart';
import 'package:ShopSM/app/view_models/remote_config_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final remoteConfigNotifierProvider =
    StateNotifierProvider<RemoteConfigNotifier, RemoteConfigState>(
        (ref) => RemoteConfigNotifier(ref.watch(remoteConfigRepository)));

class RemoteConfigNotifier extends StateNotifier<RemoteConfigState> {
  final RemoteConfigRepository repository;

  RemoteConfigNotifier(this.repository)
      : super(const RemoteConfigState.initial());

  Future<void> subscribe() async {
    repository.onConfigUpdated.listen((event) {
      state = RemoteConfigState.remoteConfig(event);
    });
    await repository.init();
  }
}
