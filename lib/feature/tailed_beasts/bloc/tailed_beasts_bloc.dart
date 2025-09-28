import 'package:flutter_bloc/flutter_bloc.dart';
import 'tailed_beasts_event.dart';
import 'tailed_beasts_state.dart';
import '../../../data/repository/api_repository.dart';

class TailedBeastsBloc extends Bloc<TailedBeastsEvent, TailedBeastsState> {
  TailedBeastsBloc(this._repo) : super(const TailedBeastsState()) {
    on<TailedBeastsRequested>(_onRequested);
  }

  final ApiRepository _repo;

  Future<void> _onRequested(
      TailedBeastsRequested event,
      Emitter<TailedBeastsState> emit,
      ) async {
    emit(state.copyWith(status: TailedBeastsStatus.loading));
    try {
      final data = await _repo.getTailedBeasts();
      emit(state.copyWith(status: TailedBeastsStatus.success, items: data));
    } catch (e) {
      emit(state.copyWith(status: TailedBeastsStatus.failure, error: e.toString()));
    }
  }
}
