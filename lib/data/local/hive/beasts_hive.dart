import 'package:hive/hive.dart';

import '../../../feature/tailed_beasts/model/tailed_beast.dart';

class BeastsHive {
  static const boxName = 'tailed_beasts_box';

  Box<TailedBeast> get _box => Hive.box<TailedBeast>(boxName);

  Future<void> saveAll(List<TailedBeast> items) async {
    await _box.clear();
    await _box.addAll(items);
  }

  List<TailedBeast> getAll() {
    return _box.values.toList(growable: false);
  }

  bool get isEmpty => _box.isEmpty;

  Future<void> clear() => _box.clear();
}
