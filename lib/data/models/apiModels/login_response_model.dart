class LoginResponse {
  String? token;
  User? user;
  int? code;

  LoginResponse({this.token, this.user, this.code});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? username;
  String? userType;
  String? userableType;
  int? userableId;
  String? accessLevel;
  int? appUser;
  String? gender;
  String? phone;
  String? email;
  dynamic wardId;
  dynamic salePointId;
  dynamic cooperativeUnionId;
  dynamic primarySocietyId;
  dynamic activated;
  dynamic isActive;
  dynamic imageUrl;
  String? createdAt;
  String? updatedAt;
  int? changePassword;

  User(
      {this.id,
      this.fullName,
      this.username,
      this.userType,
      this.userableType,
      this.userableId,
      this.accessLevel,
      this.appUser,
      this.gender,
      this.phone,
      this.email,
      this.wardId,
      this.salePointId,
      this.cooperativeUnionId,
      this.primarySocietyId,
      this.activated,
      this.isActive,
      this.imageUrl,
      this.createdAt,
      this.updatedAt,
      this.changePassword});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    username = json['username'];
    userType = json['user_type'];
    userableType = json['userable_type'];
    userableId = json['userable_id'];
    accessLevel = json['access_level'];
    appUser = json['app_user'];
    gender = json['gender'];
    phone = json['phone'];
    email = json['email'];
    wardId = json['ward_id'];
    salePointId = json['sale_point_id'];
    cooperativeUnionId = json['cooperative_union_id'];
    primarySocietyId = json['primary_society_id'];
    activated = json['activated'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    changePassword = json['change_password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['username'] = username;
    data['user_type'] = userType;
    data['userable_type'] = userableType;
    data['userable_id'] = userableId;
    data['access_level'] = accessLevel;
    data['app_user'] = appUser;
    data['gender'] = gender;
    data['phone'] = phone;
    data['email'] = email;
    data['ward_id'] = wardId;
    data['sale_point_id'] = salePointId;
    data['cooperative_union_id'] = cooperativeUnionId;
    data['primary_society_id'] = primarySocietyId;
    data['activated'] = activated;
    data['is_active'] = isActive;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['change_password'] = changePassword;
    return data;
  }
}
