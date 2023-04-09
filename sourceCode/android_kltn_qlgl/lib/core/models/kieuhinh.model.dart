// ignore_for_file: camel_case_types

class kieuhinhModel {
  int? _id;
  String? _kieuhinhTen;
  String? _kieuhinhMota;
  String? _createdAt;
  String? _updatedAt;

  kieuhinhModel({
    int? id,
    String? kieuhinhTen,
    String? kieuhinhMota,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if (kieuhinhTen != null) {
      _kieuhinhTen = kieuhinhTen;
    }
    if (kieuhinhMota != null) {
      _kieuhinhMota = kieuhinhMota;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get kieuhinhTen => _kieuhinhTen;
  String? get kieuhinhMota => _kieuhinhMota;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set kieuhinhTen(String? kieuhinhTen) => _kieuhinhTen = kieuhinhTen;
  set kieuhinhMota(String? kieuhinhMota) => _kieuhinhMota = kieuhinhMota;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  kieuhinhModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _kieuhinhTen = json['kieuhinh_ten'];
    _kieuhinhMota = json['kieuhinh_mota'] ?? 'Chưa cập nhật';
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['kieuhinh_ten'] = _kieuhinhTen;
    data['kieuhinh_mota'] = _kieuhinhMota;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}