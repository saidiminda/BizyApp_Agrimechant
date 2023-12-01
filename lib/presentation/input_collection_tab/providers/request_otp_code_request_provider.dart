import 'package:get/get.dart';

import '../../../core/utils/string_constant.dart';
import '../models/request_otp_code_request_model.dart';

class RequestOtpCodeRequestProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>)
        return RequestOtpCodeRequest.fromJson(map);
      if (map is List)
        return map.map((item) => RequestOtpCodeRequest.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<RequestOtpCodeRequest?> getRequestOtpCodeRequest(int id) async {
    final response = await get('requestotpcoderequest/$id');
    return response.body;
  }

  Future<Response> postRequestOtpCodeRequest(
      RequestOtpCodeRequest requestotpcoderequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        StringConstant.baseUrl + StringConstant.endRequestOtpCodeRequestApi,
        requestotpcoderequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> deleteRequestOtpCodeRequest(int id) async =>
      await delete('requestotpcoderequest/$id');
}
