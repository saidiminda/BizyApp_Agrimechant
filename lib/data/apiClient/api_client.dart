import 'package:saidi_s_application3/core/app_export.dart';

import '../../core/utils/string_constant.dart';
import '../models/apiModels/advisory_request_model.dart';
import '../models/apiModels/change_password_request_model.dart';
import '../models/apiModels/comment_post_and_event_model.dart';
import '../models/apiModels/create_post_and_events_request_model.dart';
import '../models/apiModels/entity_id_and_user_id_request_body_model.dart';
import '../models/apiModels/forgate_password_otp_confirm_model.dart';
import '../models/apiModels/forgate_password_request_model.dart';
import '../models/apiModels/login_request_model.dart';
import '../models/apiModels/openweather_request_model.dart';
import '../models/apiModels/register_farmer_request_model.dart';
import '../models/apiModels/store_comment_request_model.dart';

class ApiClient extends GetConnect {
   Future<Response> getDashboardResponse(int? id, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response =
        await get(apiBaseUrl + endDashboardApi + id.toString(), headers: {
      "Authorization": "Bearer $token",
    });
    return response;
  }

  Future<Response> getSingleFarmerResponse(
      String farmerNumber, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response =
        await get("$endSearchFarmerForEditApi$farmerNumber", headers: {
      "Authorization": "Bearer $token",
    });
    return response;
  }

  Future<Response> getListOfFarmerResponse(String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await get("$apiBaseUrl$endFarmerListApi", headers: {
      "Authorization": "Bearer $token",
    });
    return response;
  }

  Future<Response> postRegisterFarmerRequest(
      RegisterFarmerRequest registerfarmerrequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        "$apiBaseUrl$endSendFarmersApi", registerfarmerrequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> postCratePostAndEventRequest(
      CreatePostAndEventsRequest createPostAndEventsRequest,
      String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        "$apiBaseUrl$endCreatePostApi", createPostAndEventsRequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> getCratePostAndEventResponse(String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await get("$apiBaseUrl$endPostAndEventListApi", headers: {
      "Authorization": "Bearer $token",
    });
    return response;
  }

  Future<Response> postCommentPostAndEventRequest(
      CommentPostAndEvent commentPostAndEvent, int id, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post("$apiBaseUrl$endCommentPostAndEventApi$id",
        commentPostAndEvent.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> getCommentsListResponse(String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await get("$apiBaseUrl$endGetCommentsListApi", headers: {
      "Authorization": "Bearer $token",
    });
    return response;
  }

  Future<Response> postCommentRequest(
      StoreCommentRequest storeCommentRequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        "$apiBaseUrl$endStoreCommentApi", storeCommentRequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> postReplayCommentRequest(
      StoreCommentRequest storeCommentRequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        "$apiBaseUrl$endReplayCommentApi", storeCommentRequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> getAdvisoryListResponse(String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await get("$apiBaseUrl$endGetAdvisoryListApi", headers: {
      "Authorization": "Bearer $token",
    });
    return response;
  }

  Future<Response> postAdvisoryRequest(
      AdvisoryRequest advisoryRequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        "$apiBaseUrl$endStoryAdvisoryRequestApi", advisoryRequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> postLoginRequest(LoginRequest loginrequest) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response =
        await post("$apiBaseUrl$endLoginApi", loginrequest.toJson());
    return response;
  }

  Future<Response> postForgatePasswordRequest(
      ForgatePasswordRequest forgatePasswordRequest) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        "$apiBaseUrl$endForgatePasswordApi", forgatePasswordRequest.toJson());
    return response;
  }

  Future<Response> postForgatePasswordOTPRequest(
      ForgatePasswordOtpConfirm forgatePasswordOtp) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        "$apiBaseUrl$endForgatePasswordOTPApi", forgatePasswordOtp.toJson());
    return response;
  }

  Future<Response> postProfileResponse(
      EntityIdAndUserIdRequestBody entityIdAndUserId, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response = await post(
        apiBaseUrl + endProfileApi, entityIdAndUserId.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> postChangePasswordRequest(
      ChangePasswordRequest changepasswordrequest, String token) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    //  httpClient = HttpClient()..badCertificateCallback=(cert, host, port) => host==
    // trustedCertificates = [TrustedCertificate(base64Decode(source))];
    final response = await post(
        apiBaseUrl + endChangePasswordApi, changepasswordrequest.toJson(),
        headers: {
          "Authorization": "Bearer $token",
        });
    return response;
  }

  Future<Response> getOpenWetherResponse(
      OpenweatherRequest openweatherRequest) async {
    timeout = const Duration(minutes: 5);
    allowAutoSignedCert = true;
    final response =
        await get(openWeaterApiUrl, query: openweatherRequest.toJson());
    return response;
  }
}
