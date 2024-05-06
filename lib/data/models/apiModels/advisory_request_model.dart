class AdvisoryRequest {
  int? id;
  int? userId;
  List<int>? farmerIds;
  int? isBulk;
  int? pinned;
  String? message;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Farmer>? farmers;
  UserAdv? user;

  AdvisoryRequest(
      {this.id,
      this.userId,
      this.farmerIds,
      this.isBulk,
      this.pinned,
      this.message,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.farmers,
      this.user});

  AdvisoryRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = int.tryParse(json['user_id'].toString());
    farmerIds = (json['farmer_ids'] ?? []).cast<int>();
    isBulk = int.tryParse(json['is_bulk'].toString());
    pinned = int.tryParse(json['pinned'].toString());
    message = json['message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['farmers'] != null) {
      farmers = <Farmer>[];
      json['farmers'].forEach((v) {
        farmers?.add(Farmer.fromJson(v));
      });
    }
    user = json['user'] != null ? UserAdv?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['farmer_ids'] = farmerIds;
    data['is_bulk'] = isBulk;
    data['pinned'] = pinned;
    data['message'] = message;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (farmers != null) {
      data['farmers'] = farmers?.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user?.toJson();
    }
    return data;
  }
}

class Farmer {
  int? id;
  String? name;
  String? farmerType;
  String? gender;
  String? dateOfBirth;
  int? villageId;
  int? farmerGroupId;
  int? userId;
  String? phoneNumber;
  dynamic institutionType;
  String? identityType;
  String? identityNumber;
  dynamic contactPersonName;
  dynamic contactPersonPhoneNumber;
  String? wallet;
  int? ownsSmartPhone;
  int? leadFarmer;
  String? avatar;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Pivot? pivot;

  Farmer(
      {this.id,
      this.name,
      this.farmerType,
      this.gender,
      this.dateOfBirth,
      this.villageId,
      this.farmerGroupId,
      this.userId,
      this.phoneNumber,
      this.institutionType,
      this.identityType,
      this.identityNumber,
      this.contactPersonName,
      this.contactPersonPhoneNumber,
      this.wallet,
      this.ownsSmartPhone,
      this.leadFarmer,
      this.avatar,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot});

  Farmer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    farmerType = json['farmer_type'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    villageId = int.tryParse(json['village_id'].toString());
    farmerGroupId = int.tryParse(json['farmer_group_id'].toString());
    userId = int.tryParse(json['user_id'].toString());
    phoneNumber = json['phone_number'];
    institutionType = json['institution_type'];
    identityType = json['identity_type'];
    identityNumber = json['identity_number'];
    contactPersonName = json['contact_person_name'];
    contactPersonPhoneNumber = json['contact_person_phone_number'];
    wallet = json['wallet'];
    ownsSmartPhone = int.tryParse(json['owns_smart_phone'].toString());
    leadFarmer = int.tryParse(json['lead_farmer'].toString());
    avatar = json['avatar'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = json['pivot'] != null ? Pivot?.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['farmer_type'] = farmerType;
    data['gender'] = gender;
    data['date_of_birth'] = dateOfBirth;
    data['village_id'] = villageId;
    data['farmer_group_id'] = farmerGroupId;
    data['user_id'] = userId;
    data['phone_number'] = phoneNumber;
    data['institution_type'] = institutionType;
    data['identity_type'] = identityType;
    data['identity_number'] = identityNumber;
    data['contact_person_name'] = contactPersonName;
    data['contact_person_phone_number'] = contactPersonPhoneNumber;
    data['wallet'] = wallet;
    data['owns_smart_phone'] = ownsSmartPhone;
    data['lead_farmer'] = leadFarmer;
    data['avatar'] = avatar;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (pivot != null) {
      data['pivot'] = pivot?.toJson();
    }
    return data;
  }
}

class Pivot {
  int? advisoryCommentId;
  int? farmerId;

  Pivot({this.advisoryCommentId, this.farmerId});

  Pivot.fromJson(Map<String, dynamic> json) {
    advisoryCommentId = int.tryParse(json['advisory_comment_id'].toString());
    farmerId = int.tryParse(json['farmer_id'].toString());
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['advisory_comment_id'] = advisoryCommentId;
    data['farmer_id'] = farmerId;
    return data;
  }
}

class UserAdv {
  int? id;
  String? name;
  String? email;
  String? username;
  String? phoneNumber;
  int? farmerId;
  dynamic emailVerifiedAt;
  int? changePassword;
  String? createdAt;
  String? updatedAt;

  UserAdv(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.phoneNumber,
      this.farmerId,
      this.emailVerifiedAt,
      this.changePassword,
      this.createdAt,
      this.updatedAt});

  UserAdv.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    farmerId = int.tryParse(json['farmer_id'].toString());
    emailVerifiedAt = json['email_verified_at'];
    changePassword = int.tryParse(json['change_password'].toString());
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['phone_number'] = phoneNumber;
    data['farmer_id'] = farmerId;
    data['email_verified_at'] = emailVerifiedAt;
    data['change_password'] = changePassword;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
