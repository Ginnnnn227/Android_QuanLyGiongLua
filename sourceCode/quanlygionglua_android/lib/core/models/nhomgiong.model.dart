// ignore_for_file: camel_case_types, unnecessary_getters_setters

class nhomgiongModel {
  int? _id;
  String? _nhomgiongCode;
  String? _nhomgiongTen;
  String? _nhomgiongMota;
  String? _nhomgiongNgayngam;
  String? _nhomgiongNgaycay;
  String? _createdAt;
  String? _updatedAt;

  nhomgiongModel({
      int? id,
      String? nhomgiongCode,
      String? nhomgiongTen,
      String? nhomgiongMota,
      String? nhomgiongNgayngam,
      String? nhomgiongNgaycay,
      String? createdAt,
      String? updatedAt
      }) {
    if (id != null) {
      _id = id;
    }
    if (nhomgiongCode != null) {
      _nhomgiongCode = nhomgiongCode;
    }
    if (nhomgiongTen != null) {
      _nhomgiongTen = nhomgiongTen;
    }
    if (nhomgiongMota != null) {
      _nhomgiongMota = nhomgiongMota;
    }
    if (nhomgiongNgayngam != null) {
      _nhomgiongNgayngam = nhomgiongNgayngam;
    }
    if (nhomgiongNgaycay != null) {
      _nhomgiongNgaycay = nhomgiongNgaycay;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get nhomgiongCode => _nhomgiongCode;
  String? get nhomgiongTen => _nhomgiongTen;
  String? get nhomgiongMota => _nhomgiongMota;
  String? get nhomgiongNgayngam => _nhomgiongNgayngam;
  String? get nhomgiongNgaycay => _nhomgiongNgaycay;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set nhomgiongCode(String? nhomgiongCode) => _nhomgiongCode = nhomgiongCode;
  set nhomgiongTen(String? nhomgiongTen) => _nhomgiongTen = nhomgiongTen;
  set nhomgiongMota(String? nhomgiongMota) => _nhomgiongMota = nhomgiongMota;
  set nhomgiongNgayngam(String? nhomgiongNgayngam) => _nhomgiongNgayngam = nhomgiongNgayngam;
  set nhomgiongNgaycay(String? nhomgiongNgaycay) => _nhomgiongNgaycay = nhomgiongNgaycay;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  nhomgiongModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nhomgiongCode = json['nhomgiong_code'];
    _nhomgiongTen = json['nhomgiong_ten'];
    _nhomgiongMota = json['nhomgiong_mota'] ?? 'Chưa cập nhật';
    _nhomgiongNgayngam = json['nhomgiong_ngayngam']?? 'Chưa cập nhật';
    _nhomgiongNgaycay = json['nhomgiong_ngaycay']?? 'Chưa cập nhật';
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['nhomgiong_code'] = _nhomgiongCode;
    data['nhomgiong_ten'] = _nhomgiongTen;
    data['nhomgiong_mota'] = _nhomgiongMota;
    data['nhomgiong_ngayngam'] = _nhomgiongNgayngam;
    data['nhomgiong_ngaycay'] = _nhomgiongNgaycay;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}