class EntityIdAndUserIdRequestBody {
  int? entityId;
  int? userId;
  String? deviceId;

  EntityIdAndUserIdRequestBody({this.entityId, this.userId, this.deviceId});

  EntityIdAndUserIdRequestBody.fromJson(Map<String, dynamic> json) {
    entityId = json['entity_id'];
    userId = json['user_id'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['entity_id'] = entityId;
    data['user_id'] = userId;
    data['device_id'] = deviceId;
    return data;
  }
}
