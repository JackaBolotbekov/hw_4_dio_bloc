import 'package:dio/dio.dart';
import '../api/api_service.dart';
import '../../feature/tailed_beasts/model/tailed_beast.dart';

class ApiRepository {
  ApiRepository({Dio? dio}) : _api = ApiService(dio ?? Dio());

  final ApiService _api;

  Future<List<TailedBeast>> getTailedBeasts() => _api.fetchTailedBeasts();
}
