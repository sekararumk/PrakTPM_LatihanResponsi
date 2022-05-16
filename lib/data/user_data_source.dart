import 'package:latianresponsi_123190135/data/base_network.dart';

class UserDataSource {
  static UserDataSource instance = UserDataSource();

  Future<Map<String, dynamic>> getAllUser(username) {
    return BaseNetwork.get("search/users?q=$username&type=users&per_page=20");
  }
}