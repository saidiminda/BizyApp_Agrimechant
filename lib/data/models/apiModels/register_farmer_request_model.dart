class RegisterFarmerRequest {
  String? imeiNumber;
  String? appVersionName;
  String? date;
  String? time;
  int? lastFarmerIndex;
  List<Farmers>? farmers;

  RegisterFarmerRequest(
      {this.imeiNumber,
      this.appVersionName,
      this.date,
      this.time,
      this.lastFarmerIndex,
      this.farmers});

  RegisterFarmerRequest.fromJson(Map<String, dynamic> json) {
    imeiNumber = json['imei_number'];
    appVersionName = json['app_version_name'];
    date = json['date'];
    time = json['time'];
    lastFarmerIndex = json['last_farmer_index'];
    if (json['farmers'] != null) {
      farmers = <Farmers>[];
      json['farmers'].forEach((v) {
        farmers?.add(Farmers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imei_number'] = imeiNumber;
    data['app_version_name'] = appVersionName;
    data['date'] = date;
    data['time'] = time;
    data['last_farmer_index'] = lastFarmerIndex;
    if (farmers != null) {
      data['farmers'] = farmers?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Farmers {
  int? id;
  int? editingStatus;
  int? userId;
  String? registrationStatus;
  Data? data;

  Farmers(
      {this.id,
      this.editingStatus,
      this.userId,
      this.registrationStatus,
      this.data});

  Farmers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    editingStatus = json['editing_status'];
    userId = int.tryParse(json['user_id'].toString());
    registrationStatus = json['registration_status'];
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data1 = <String, dynamic>{};
    data1['id'] = id;
    data1['editing_status'] = editingStatus;
    data1['user_id'] = userId;
    data1['registration_status'] = registrationStatus;
    if (data != null) {
      data1['data'] = data?.toJson();
    }
    return data1;
  }
}

class Data {
  GeneralInfo? generalInfo;
  List<FarmInfo>? farmInfo;
  FarmerImage? image;
  String? imageUrl;

  Data({this.generalInfo, this.farmInfo, this.image, this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    generalInfo = json['general_info'] != null
        ? GeneralInfo?.fromJson(json['general_info'])
        : null;
    if (json['farm_info'] != null) {
      farmInfo = <FarmInfo>[];
      json['farm_info'].forEach((v) {
        farmInfo?.add(FarmInfo.fromJson(v));
      });
    }
    image = json['image'] != null ? FarmerImage?.fromJson(json['image']) : null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (generalInfo != null) {
      data['general_info'] = generalInfo?.toJson();
    }
    if (farmInfo != null) {
      data['farm_info'] = farmInfo?.map((v) => v.toJson()).toList();
    }
    if (image != null) {
      data['image'] = image?.toJson();
    }
    data['image_url'] = imageUrl;
    return data;
  }
}

class GeneralInfo {
  int? id;
  String? name;
  String? gender;
  String? phoneNumber;
  int? villageId;
  int? ownsSmartPhone;
  List<int>? communitySeedBankIds;
  String? dateOfBirth;
  int? farmerGroupId;
  String? farmerType;
  String? institutionType;
  String? registrationType;
  String? contactPersonPhoneNumber;
  String? contactPersonName;
  String? wallet;
  FingerPrintData? fingerPrintData;
  List<int>? areaOfOperation;
  List<String>? workingFacilities;
  String? identityType;
  String? isMember;
  String? identityNumber;

  GeneralInfo(
      {this.id,
      this.name,
      this.gender,
      this.phoneNumber,
      this.villageId,
      this.ownsSmartPhone,
      this.communitySeedBankIds,
      this.dateOfBirth,
      this.farmerGroupId,
      this.farmerType,
      this.institutionType,
      this.registrationType,
      this.contactPersonPhoneNumber,
      this.contactPersonName,
      this.wallet,
      this.fingerPrintData,
      this.areaOfOperation,
      this.workingFacilities,
      this.identityType,
      this.isMember,
      this.identityNumber});

  GeneralInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    villageId = int.tryParse(json['village_id'].toString());
    ownsSmartPhone = int.tryParse(json['owns_smart_phone'].toString());
    communitySeedBankIds = (json['community_seed_bank_ids'] ?? []).cast<int>();
    dateOfBirth = json['date_of_birth'];
    farmerGroupId = int.tryParse(json['farmer_group_id'].toString());
    farmerType = json['farmer_type'];
    institutionType = json['institution_type'];
    registrationType = json['registration_type'];
    contactPersonPhoneNumber = json['contact_person_phone_number'];
    contactPersonName = json['contact_person_name'];
    wallet = json['wallet'];
    fingerPrintData = json['fingerPrintData'] != null
        ? FingerPrintData?.fromJson(json['fingerPrintData'])
        : null;
    areaOfOperation = (json['area_of_operation'] ?? []).cast<int>();
    workingFacilities = (json['working_facilities'] ?? []).cast<String>();
    identityType = json['identity_type'];
    isMember = json['is_member'];
    identityNumber = json['identity_number'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['village_id'] = villageId;
    data['owns_smart_phone'] = ownsSmartPhone;
    data['community_seed_bank_ids'] = communitySeedBankIds;
    data['date_of_birth'] = dateOfBirth;
    data['farmer_group_id'] = farmerGroupId;
    data['farmer_type'] = farmerType;
    data['institution_type'] = institutionType;
    data['registration_type'] = registrationType;
    data['contact_person_phone_number'] = contactPersonPhoneNumber;
    data['contact_person_name'] = contactPersonName;
    data['wallet'] = wallet;
    if (fingerPrintData != null) {
      data['fingerPrintData'] = fingerPrintData?.toJson();
    }
    data['area_of_operation'] = areaOfOperation;
    data['working_facilities'] = workingFacilities;
    data['identity_type'] = identityType;
    data['is_member'] = isMember;
    data['identity_number'] = identityNumber;
    return data;
  }
}

class FingerPrintData {
  String? finger1;
  String? finger2;
  String? finger3;

  FingerPrintData({this.finger1, this.finger2, this.finger3});

  FingerPrintData.fromJson(Map<String, dynamic> json) {
    finger1 = json['finger1'];
    finger2 = json['finger2'];
    finger3 = json['finger3'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['finger1'] = finger1;
    data['finger2'] = finger2;
    data['finger3'] = finger3;
    return data;
  }
}

class FarmInfo {
  int? id;
  int? villageId;
  String? farmSize;
  List<int>? cropIds;
  String? ownership;
  List<FarmCoordinates>? farmCoordinates;

  FarmInfo(
      {this.id,
      this.villageId,
      this.farmSize,
      this.cropIds,
      this.ownership,
      this.farmCoordinates});

  FarmInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    villageId = int.tryParse(json['village_id'].toString());
    farmSize = json['farm_size'];
    cropIds = (json['crop_ids'] ?? []).cast<int>();
    ownership = json['ownership'];
    if (json['farm_coordinates'] != null) {
      farmCoordinates = <FarmCoordinates>[];
      json['farm_coordinates'].forEach((v) {
        farmCoordinates?.add(FarmCoordinates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['village_id'] = villageId;
    data['farm_size'] = farmSize;
    data['crop_ids'] = cropIds;
    data['ownership'] = ownership;
    if (farmCoordinates != null) {
      data['farm_coordinates'] =
          farmCoordinates?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FarmCoordinates {
  double? latitude;
  double? longitude;

  FarmCoordinates({this.latitude, this.longitude});

  FarmCoordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class FarmerImage {
  String? image;

  FarmerImage({this.image});

  FarmerImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}
