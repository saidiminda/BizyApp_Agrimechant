class OpenweatherRequest {
  String? lat;
  String? lon;
  String? appid;

  OpenweatherRequest({this.lat, this.lon, this.appid});

  OpenweatherRequest.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    appid = json['appid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['appid'] = appid;
    return data;
  }
}
