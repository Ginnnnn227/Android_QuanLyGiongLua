// ignore_for_file: camel_case_types, unnecessary_getters_setters

class loaigiatridoModel {
  int? _id;
  String? _loaigiatridoTen;
  String? _loaigiatridoDonVi;
  int? _phanLoai;
  String? _createdAt;
  String? _updatedAt;

  loaigiatridoModel({
    int? id,
    String? loaigiatridoTen,
    String? loaigiatridoDonVi,
    int? phanLoai,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if (loaigiatridoTen != null) {
      _loaigiatridoTen = loaigiatridoTen;
    }
    if (loaigiatridoDonVi != null) {
      _loaigiatridoDonVi = loaigiatridoDonVi;
    }
    if (phanLoai != null) {
      _phanLoai = phanLoai;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get loaigiatridoTen => _loaigiatridoTen;
  String? get loaigiatridoDonVi => _loaigiatridoDonVi;
  int? get phanLoai => _phanLoai;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set loaigiatridoTen(String? loaigiatridoTen) => _loaigiatridoTen = loaigiatridoTen;
  set loaigiatridoDonVi(String? loaigiatridoDonVi) => _loaigiatridoDonVi = loaigiatridoDonVi;
  set phanLoai(int? phanLoai) => _phanLoai = phanLoai;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  loaigiatridoModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _loaigiatridoTen = json['loaigiatrido_ten'];
    _loaigiatridoDonVi = json['loaigiatrido_donvi'] ?? 'Chưa cập ';
    _phanLoai = json['phanloai'] ?? 'Chưa cập nhật';
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['loaigiatrido_ten'] = _loaigiatridoTen;
    data['loaigiatrido_donvi'] = _loaigiatridoDonVi;
    data['phanloai'] = _phanLoai;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}