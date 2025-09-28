import '../api/api_service.dart';
import '../../feature/tailed_beasts/model/tailed_beast.dart';

class ApiRepository {
  ApiRepository(this._api);

  final ApiService _api;

  Future<List<TailedBeast>> getTailedBeasts() => _api.fetchTailedBeasts();
}
