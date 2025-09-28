import 'package:dio/dio.dart';
import '../../feature/tailed_beasts/model/tailed_beast.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<List<TailedBeast>> fetchTailedBeasts() async {
    final res = await _dio.get('https://dattebayo-api.onrender.com/tailed-beasts');

    // ВАЖНО: верхний уровень — объект, вытаскиваем массив по ключу 'tailed-beasts'
    final list = (res.data['tailed-beasts'] as List)
        .map((e) => TailedBeast.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    return list;
  }
}
