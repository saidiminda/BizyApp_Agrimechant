// import '../../../presentation/login_screen/models/login_response_model.dart';

// class ProfileResponse {
//   User? profile;
//   Summary? summary = Summary();
//   List<Outlet>? outlets;

//   ProfileResponse({this.profile, this.summary, this.outlets});

//   ProfileResponse.fromJson(Map<String, dynamic> json) {
//     profile = json['profile'] != null ? User?.fromJson(json['profile']) : null;
//     summary =
//         json['summary'] != null ? Summary?.fromJson(json['summary']) : null;
//     if (json['outlets'] != null) {
//       outlets = <Outlet>[];
//       json['outlets'].forEach((v) {
//         outlets?.add(Outlet.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (profile != null) {
//       data['profile'] = profile?.toJson();
//     }
//     if (summary != null) {
//       data['summary'] = summary?.toJson();
//     }
//     if (outlets != null) {
//       data['outlets'] = outlets?.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Summary {
//   num? subsidyTotal;
//   num? salesTotal;
//   num? totalBulk;
//   num? totalCash;

//   Summary(
//       {this.subsidyTotal = 0,
//       this.salesTotal = 0,
//       this.totalBulk = 0,
//       this.totalCash = 0});

//   Summary.fromJson(Map<String, dynamic> json) {
//     subsidyTotal = json['subsidy_total'];
//     salesTotal = json['sales_total'];
//     totalBulk = json['total_bulk'];
//     totalCash = json['total_cash'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['subsidy_total'] = subsidyTotal;
//     data['sales_total'] = salesTotal;
//     data['total_bulk'] = totalBulk;
//     data['total_cash'] = totalCash;
//     return data;
//   }
// }

// class Outlet {
//   int? id;
//   dynamic uid;
//   dynamic currencyId;
//   dynamic countryId;
//   int? villageId;
//   dynamic geolocationId;
//   dynamic entityId;
//   int? userId;
//   String? name;
//   String? tradingName;
//   String? abbreviation;
//   String? tfraIdentificationNumber;
//   dynamic domain;
//   String? type;
//   String? isActive;
//   dynamic taxId;
//   dynamic isGroup;
//   dynamic avatarUrl;
//   dynamic descriptions;
//   String? createdAt;
//   String? updatedAt;
//   int? workstreamId;
//   int? regionId;
//   String? regionName;
//   int? districtId;
//   String? districtName;
//   int? wardId;
//   String? wardName;
//   String? villageName;

//   Outlet(
//       {this.id,
//       this.uid,
//       this.currencyId,
//       this.countryId,
//       this.villageId,
//       this.geolocationId,
//       this.entityId,
//       this.userId,
//       this.name,
//       this.tradingName,
//       this.abbreviation,
//       this.tfraIdentificationNumber,
//       this.domain,
//       this.type,
//       this.isActive,
//       this.taxId,
//       this.isGroup,
//       this.avatarUrl,
//       this.descriptions,
//       this.createdAt,
//       this.updatedAt,
//       this.workstreamId,
//       this.regionId,
//       this.regionName,
//       this.districtId,
//       this.districtName,
//       this.wardId,
//       this.wardName,
//       this.villageName});

//   Outlet.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     uid = json['uid'];
//     currencyId = json['currency_id'];
//     countryId = json['country_id'];
//     villageId = json['village_id'];
//     geolocationId = json['geolocation_id'];
//     entityId = json['entity_id'];
//     userId = json['user_id'];
//     name = json['name'];
//     tradingName = json['trading_name'];
//     abbreviation = json['abbreviation'];
//     tfraIdentificationNumber = json['tfra_identification_number'];
//     domain = json['domain'];
//     type = json['type'];
//     isActive = json['is_active'];
//     taxId = json['tax_id'];
//     isGroup = json['is_group'];
//     avatarUrl = json['avatar_url'];
//     descriptions = json['descriptions'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     workstreamId = json['workstream_id'];
//     regionId = json['region_id'];
//     regionName = json['region_name'];
//     districtId = json['district_id'];
//     districtName = json['district_name'];
//     wardId = json['ward_id'];
//     wardName = json['ward_name'];
//     villageName = json['village_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['uid'] = uid;
//     data['currency_id'] = currencyId;
//     data['country_id'] = countryId;
//     data['village_id'] = villageId;
//     data['geolocation_id'] = geolocationId;
//     data['entity_id'] = entityId;
//     data['user_id'] = userId;
//     data['name'] = name;
//     data['trading_name'] = tradingName;
//     data['abbreviation'] = abbreviation;
//     data['tfra_identification_number'] = tfraIdentificationNumber;
//     data['domain'] = domain;
//     data['type'] = type;
//     data['is_active'] = isActive;
//     data['tax_id'] = taxId;
//     data['is_group'] = isGroup;
//     data['avatar_url'] = avatarUrl;
//     data['descriptions'] = descriptions;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['workstream_id'] = workstreamId;
//     data['region_id'] = regionId;
//     data['region_name'] = regionName;
//     data['district_id'] = districtId;
//     data['district_name'] = districtName;
//     data['ward_id'] = wardId;
//     data['ward_name'] = wardName;
//     data['village_name'] = villageName;
//     return data;
//   }
// }
