import 'package:get/get.dart';

import '../../../core/utils/string_constant.dart';
import '../models/member_orders_request_model.dart';

class MemberOrdersRequestProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return MemberOrdersRequest.fromJson(map);
      if (map is List) {
        return map.map((item) => MemberOrdersRequest.fromJson(item)).toList();
      }
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<MemberOrdersRequest?> getMemberOrdersRequest(int id) async {
    final response = await get('memberordersrequest/$id');
    return response.body;
  }

  Future<Response> postMemberOrdersRequest(
      MemberOrdersRequest memberordersrequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        apiBaseUrl + endStorePodApi, memberordersrequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> postAutoQRCodesScanRequest(
      MemberOrdersRequest memberordersrequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(apiBaseUrl + endAutoScanQrcodeApi,
        memberordersrequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> deleteMemberOrdersRequest(int id) async =>
      await delete('memberordersrequest/$id');
}
