import '../model/tailed_beast.dart';

enum TailedBeastsStatus { initial, loading, success, empty, failure }

class TailedBeastsState {
  final TailedBeastsStatus status;
  final List<TailedBeast> items;
  final String? error;

  const TailedBeastsState({
    this.status = TailedBeastsStatus.initial,
    this.items = const [],
    this.error,
  });

  TailedBeastsState copyWith({
    TailedBeastsStatus? status,
    List<TailedBeast>? items,
    String? error,
  }) {
    return TailedBeastsState(
      status: status ?? this.status,
      items: items ?? this.items,
      error: error,
    );
  }
}
