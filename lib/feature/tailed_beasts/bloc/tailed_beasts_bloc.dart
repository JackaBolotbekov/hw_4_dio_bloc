import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/hive/beasts_hive.dart';
import '../../../data/repository/api_repository.dart';
import 'tailed_beasts_event.dart';
import 'tailed_beasts_state.dart';

class TailedBeastsBloc extends Bloc<TailedBeastsEvent, TailedBeastsState> {
  TailedBeastsBloc(this._api, this._hive) : super(const TailedBeastsState()) {
    on<LoadFromHiveRequested>(_onLoadFromHive);
    on<LoadOnlineRequested>(_onLoadOnline);
    on<ClearHiveRequested>(_onClearHive);
  }

  final ApiRepository _api;
  final BeastsHive _hive;

  Future<void> _onLoadFromHive(
    LoadFromHiveRequested event,
    Emitter<TailedBeastsState> emit,
  ) async {
    emit(state.copyWith(status: TailedBeastsStatus.loading, error: null));
    try {
      final list = _hive.getAll();
      emit(
        state.copyWith(
          status:
              list.isEmpty ? TailedBeastsStatus.empty : TailedBeastsStatus.success,
          items: list,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TailedBeastsStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onLoadOnline(
    LoadOnlineRequested event,
    Emitter<TailedBeastsState> emit,
  ) async {
    emit(state.copyWith(status: TailedBeastsStatus.loading, error: null));
    try {
      final list = await _api.getTailedBeasts();
      await _hive.saveAll(list);
      emit(
        state.copyWith(
          status:
              list.isEmpty ? TailedBeastsStatus.empty : TailedBeastsStatus.success,
          items: list,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TailedBeastsStatus.failure,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> _onClearHive(
    ClearHiveRequested event,
    Emitter<TailedBeastsState> emit,
  ) async {
    await _hive.clear();
    emit(
      state.copyWith(
        status: TailedBeastsStatus.empty,
        items: const [],
        error: null,
      ),
    );
  }
}
