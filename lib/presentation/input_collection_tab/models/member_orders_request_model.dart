import 'get_farmer_response_model.dart';

class MemberOrdersRequest {
  String? otpCode;
  String? memberId;
  String? phoneNumber;
  String? entityId;
  String? userId;
  String? signature;
  GetFarmerResponse? farmer;
  List<Order>? updatedFarmerOrganizations;

  MemberOrdersRequest(
      {this.otpCode,
      this.memberId,
      this.phoneNumber,
      this.entityId,
      this.userId,
      this.signature,
      this.farmer,
      this.updatedFarmerOrganizations});

  MemberOrdersRequest.fromJson(Map<String, dynamic> json) {
    otpCode = json['otp_code'];
    memberId = json['member_id'];
    phoneNumber = json['phone_number'];
    entityId = json['entity_id'];
    userId = json['user_id'];
    signature = json['signature'];
    farmer = json['farmer'] != null
        ? GetFarmerResponse?.fromJson(json['farmer'])
        : null;
    if (json['updatedFarmerOrganizations'] != null) {
      updatedFarmerOrganizations = <Order>[];
      json['updatedFarmerOrganizations'].forEach((v) {
        updatedFarmerOrganizations?.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['otp_code'] = otpCode;
    data['member_id'] = memberId;
    data['phone_number'] = phoneNumber;
    data['entity_id'] = entityId;
    data['user_id'] = userId;
    data['signature'] = signature;
    if (farmer != null) {
      data['farmer'] = farmer?.toJson();
    }
    if (updatedFarmerOrganizations != null) {
      data['updatedFarmerOrganizations'] =
          updatedFarmerOrganizations?.map((v) => v.toJson()).toList();
    }
    return data;
  }
  // String? updatedFarmerOrganizations;

  // MemberOrdersRequest({this.updatedFarmerOrganizations});

  // MemberOrdersRequest.fromJson(Map<String, dynamic> json) {
  //   updatedFarmerOrganizations = json['updatedFarmerOrganizations'];
  // }

  // Map<String, dynamic> toJson() {
  //   final data = <String, dynamic>{};
  //   data['updatedFarmerOrganizations'] = updatedFarmerOrganizations;
  //   return data;
  // }
}

class Order {
  num? amount;
  String? appVersionName;
  String? date;
  num? deliveredCount;
  String? imeiNumber;
  int? item;
  String? itemName;
  num? itemUnit;
  num? memberId;
  num? onSaleCashAmount;
  num? onSaleItemCount;
  num? onSaleSubsidyAmount;
  num? onSaleTotalPrice;
  num? packageWeight;
  num? price;
  List<String>? qrcodeDetails = [];
  num? quantity;
  num? stdUnitApp;
  num? subsidyPercentage;
  String? time;
  String? userId;
  String? userableId;
  int? warehouseId;
  int? importerId;
  num? walletId;
  String? type;
  String? phone;

  Order(
      {this.amount,
      this.appVersionName,
      this.date,
      this.deliveredCount = 0,
      this.imeiNumber,
      this.item,
      this.itemName,
      this.itemUnit,
      this.memberId,
      this.onSaleCashAmount = 0,
      this.onSaleItemCount = 0,
      this.onSaleSubsidyAmount = 0,
      this.onSaleTotalPrice = 0,
      this.packageWeight,
      this.price = 0,
      this.qrcodeDetails,
      this.quantity = 0,
      this.stdUnitApp = 0,
      this.subsidyPercentage,
      this.time,
      this.userId,
      this.userableId,
      this.warehouseId,
      this.importerId,
      this.walletId,
      this.type,
      this.phone});

  Order.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    appVersionName = json['app_version_name'];
    date = json['date'];
    deliveredCount = json['deliveredCount'];
    imeiNumber = json['imei_number'];
    item = json['item'];
    type = json['type'];
    phone = json['phone'];
    itemName = json['item_name'];
    itemUnit = json['item_unit'];
    memberId = json['member_id'];
    onSaleCashAmount = json['on_sale_cash_amount'];
    onSaleItemCount = json['on_sale_item_count'];
    onSaleSubsidyAmount = json['on_sale_subsidy_amount'];
    onSaleTotalPrice = json['on_sale_total_price'];
    packageWeight = json['package_weight'];
    price = json['price'];
    qrcodeDetails = json['qrcodeDetails'].cast<String>();
    quantity = json['quantity'];
    stdUnitApp = json['std_unit_app'];
    subsidyPercentage = json['subsidy_percentage'];
    time = json['time'];
    userId = json['user_id'];
    userableId = json['userable_id'];
    warehouseId = json['warehouse_id'];
    importerId = json['importer_id'];
    walletId = json['wallet_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['app_version_name'] = appVersionName;
    data['date'] = date;
    data['deliveredCount'] = deliveredCount;
    data['imei_number'] = imeiNumber;
    data['item'] = item;
    data['item_name'] = itemName;
    data['item_unit'] = itemUnit;
    data['member_id'] = memberId;
    data['on_sale_cash_amount'] = onSaleCashAmount;
    data['on_sale_item_count'] = onSaleItemCount;
    data['on_sale_subsidy_amount'] = onSaleSubsidyAmount;
    data['on_sale_total_price'] = onSaleTotalPrice;
    data['package_weight'] = packageWeight;
    data['price'] = price;
    data['qrcodeDetails'] = qrcodeDetails;
    data['quantity'] = quantity;
    data['std_unit_app'] = stdUnitApp;
    data['subsidy_percentage'] = subsidyPercentage;
    data['time'] = time;
    data['type'] = type;
    data['phone'] = phone;
    data['user_id'] = userId;
    data['userable_id'] = userableId;
    data['warehouse_id'] = warehouseId;
    data['importer_id'] = importerId;
    data['wallet_id'] = walletId;
    return data;
  }
}
