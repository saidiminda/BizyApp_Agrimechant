import 'package:get/get.dart';

import '../../../core/utils/string_constant.dart';
import '../models/get_farmer_request_model.dart';

class GetFarmerRequestProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return GetFarmerRequest.fromJson(map);
      if (map is List)
        return map.map((item) => GetFarmerRequest.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> getGetFarmerRequest(
      GetFarmerRequest getFarmerRequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await get(
        "${StringConstant.baseUrl}${StringConstant.endGetFarmerApi}?farmer_number=${getFarmerRequest.farmerNumber}",
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response<GetFarmerRequest>> postGetFarmerRequest(
          GetFarmerRequest getfarmerrequest) async =>
      await post('getfarmerrequest', getfarmerrequest);
  Future<Response> deleteGetFarmerRequest(int id) async =>
      await delete('getfarmerrequest/$id');
}
