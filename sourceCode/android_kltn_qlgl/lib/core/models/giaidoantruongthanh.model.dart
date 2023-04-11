// ignore_for_file: camel_case_types

class giaidoantruongthanhModel {
  int? _id;
  String? _gdttTen;
  String? _gdttMota;
  String? _createdAt;
  String? _updatedAt;

  giaidoantruongthanhModel({
    int? id,
    String? gdttTen,
    String? gdttMota,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if (gdttTen != null) {
      _gdttTen = gdttTen;
    }
    if (gdttMota != null) {
      _gdttMota = gdttMota;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get gdttTen => _gdttTen;
  String? get gdttMota => _gdttMota;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set gdttTen(String? gdttTen) => _gdttTen = gdttTen;
  set gdttMota(String? gdttMota) => _gdttMota = gdttMota;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  giaidoantruongthanhModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _gdttTen = json['giaidoantt_ten'];
    _gdttMota = json['giaidoantt_mota'] ?? 'Chưa cập nhật';
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['giaidoantt_ten'] = _gdttTen;
    data['giaidoantt_mota'] = _gdttMota;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}