import 'package:get/get.dart';

import '../../../core/utils/string_constant.dart';
import '../models/login_request_model.dart';

class LoginRequestProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return LoginRequest.fromJson(map);
      if (map is List)
        return map.map((item) => LoginRequest.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<LoginRequest?> getLoginRequest(int id) async {
    final response = await get('loginrequest/$id');
    return response.body;
  }

  Future<Response> postLoginRequest(LoginRequest loginrequest) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        StringConstant.baseUrl + StringConstant.endLoginApi,
        loginrequest.toJson());
    return response;
  }

  Future<Response> deleteLoginRequest(int id) async =>
      await delete('loginrequest/$id');
}
