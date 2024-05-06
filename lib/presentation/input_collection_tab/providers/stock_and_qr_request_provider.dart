import 'package:get/get.dart';

import '../../../core/utils/string_constant.dart';
import '../models/stock_and_qr_request_model.dart';

class StockAndQrRequestProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return StockAndQrRequest.fromJson(map);
      if (map is List)
        return map.map((item) => StockAndQrRequest.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Response> getStockAndQrRequest(
      StockAndQrRequest stockAndQrRequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await get(
        "${apiBaseUrl}${endStockAndUsedQrCodesApi}?user_id=${stockAndQrRequest.userId}",
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response<StockAndQrRequest>> postStockAndQrRequest(
          StockAndQrRequest stockandqrrequest) async =>
      await post('stockandqrrequest', stockandqrrequest);
  Future<Response> deleteStockAndQrRequest(int id) async =>
      await delete('stockandqrrequest/$id');
}
