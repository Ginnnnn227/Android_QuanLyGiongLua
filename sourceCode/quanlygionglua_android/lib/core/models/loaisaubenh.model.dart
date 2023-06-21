// ignore_for_file: camel_case_types, unnecessary_getters_setters

import 'dart:io';

class loaisaubenhModel {
  int? _id;
  String? _loaisaubenhTen;
  String? _loaisaubenhDonVi;
  String? _loaisaubenhMoTa;
  File? _loaisaubenhHinhAnh;
  String? _createdAt;
  String? _updatedAt;

  loaisaubenhModel(
      {int? id,
      String? loaisaubenhTen,
      String? loaisaubenhDonVi,
      String? loaisaubenhMoTa,
      File? loaisaubenhHinhAnh,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (loaisaubenhTen != null) {
      _loaisaubenhTen = loaisaubenhTen;
    }
    if (loaisaubenhDonVi != null) {
      _loaisaubenhDonVi = loaisaubenhDonVi;
    }
    if (loaisaubenhMoTa != null) {
      _loaisaubenhMoTa = loaisaubenhMoTa;
    }
    if (loaisaubenhHinhAnh != null) {
      _loaisaubenhHinhAnh = loaisaubenhHinhAnh;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get loaisaubenhTen => _loaisaubenhTen;
  String? get loaisaubenhDonVi => _loaisaubenhDonVi;
  String? get loaisaubenhMoTa => _loaisaubenhMoTa;
  File? get loaisaubenhHinhAnh => _loaisaubenhHinhAnh;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set loaisaubenhTen(String? loaisaubenhTen) =>
      _loaisaubenhTen = loaisaubenhTen;
  set loaisaubenhDonVi(String? loaisaubenhDonVi) =>
      _loaisaubenhDonVi = loaisaubenhDonVi;
  set loaisaubenhMoTa(String? loaisaubenhMoTa) =>
      _loaisaubenhMoTa = loaisaubenhMoTa;
  set loaisaubenhHinhAnh(File? loaisaubenhHinhAnh) =>
      _loaisaubenhHinhAnh = loaisaubenhHinhAnh;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  loaisaubenhModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _loaisaubenhTen = json['loaisaubenh_ten'];
    _loaisaubenhDonVi = json['loaisaubenh_donvi'];
    _loaisaubenhMoTa = json['loaisaubenh_mota'];
    _loaisaubenhHinhAnh = json['loaisaubenh_hinhanh'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['loaisaubenh_ten'] = _loaisaubenhTen;
    data['loaisaubenh_donvi'] = _loaisaubenhDonVi;
    data['loaisaubenh_mota'] = _loaisaubenhMoTa;
    data['loaisaubenh_hinhanh'] = _loaisaubenhHinhAnh;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
