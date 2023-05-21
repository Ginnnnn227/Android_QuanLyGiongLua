// ignore_for_file: unused_import, camel_case_types, unnecessary_getters_setters

import 'dart:convert';

class giongModel{
  int? _id;
  String? _giongTen;
  String? _giongMota;
  String? _giongNguongoc;
  String? _giongHinhanh;
  String? _nhomgiongTen;
  String? _kieuhinhTen;
  String? _createdAt;
  String? _updatedAt;

  giongModel({
    int? id,
    String? giongTen,
    String? giongMota,
    String? giongNguongoc,
    String? giongHinhanh,
    String? nhomgiongTen,
    String? kieuhinhTen,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if(giongTen != null){
      _giongTen = giongTen;
    }
    if(giongMota != null){
      _giongMota = giongMota;
    }
    if(giongNguongoc != null){
      _giongNguongoc = giongNguongoc;
    }
    if(giongHinhanh != null){
      _giongHinhanh = giongHinhanh;
    }
    if(nhomgiongTen != null){
      _nhomgiongTen = nhomgiongTen;
    }
    if(kieuhinhTen != null){
      _kieuhinhTen = kieuhinhTen;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get giongTen => _giongTen;
  String? get giongMota => _giongMota;
  String? get giongNguongoc => _giongNguongoc;
  String? get giongHinhanh => _giongHinhanh;
  String? get nhomgiongTen => _nhomgiongTen;
  String? get kieuhinhTen => _kieuhinhTen;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set giongTen(String? giongTen) => _giongTen = giongTen;
  set giongMota(String? giongMota) => _giongMota = giongMota;
  set giongNguongoc(String? giongNguongoc) => _giongNguongoc = giongNguongoc;
  set giongHinhanh(String? giongHinhanh) => _giongHinhanh = giongHinhanh;
  set nhomgiongTen(String? nhomgiongTen) => _nhomgiongTen = nhomgiongTen;
  set kieuhinhTen(String? kieuhinhTen) => _kieuhinhTen = kieuhinhTen;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  giongModel.fromJson(Map<String, dynamic>json){
    _id = json["id"];
    _giongTen = json["giong_ten"];
    _giongMota = json["giong_mota"]?? 'Chưa cập nhật';
    _giongNguongoc = json["giong_nguongoc"]?? 'Chưa cập nhật';
    _giongHinhanh = json["giong_hinhanh"];//"http://localhost:80/quanlyluagiong/storage/app/${json["giong_hinhanh"]}";
    _nhomgiongTen = json["nhomgiong_ten"];
    _kieuhinhTen = json["kieuhinh_ten"];
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String, dynamic>{};
    data["id"] = _id;
    data["giong_ten"] = _giongTen;
    data["giong_mota"] = _giongMota;
    data["giong_nguongoc"] = _giongNguongoc;
    data["giong_hinhanh"] = _giongHinhanh;
    data["nhomgiong_ten"] = _nhomgiongTen;
    data["kieuhinh_ten"] = _kieuhinhTen;
    data["created_at"] = _createdAt;
    data["updated_at"] = _updatedAt;
    return data;
  }
}