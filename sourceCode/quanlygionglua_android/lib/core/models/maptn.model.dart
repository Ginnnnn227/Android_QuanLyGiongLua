// ignore_for_file: camel_case_types, unnecessary_getters_setters

class maptnModel{
  int? _id;
  String? _giongTen;
  String? _ptnMota;
  String? _ptnCode;
  String? _createdAt;
  String? _updatedAt;

  maptnModel({
    int? id,
    String? giongTen,
    String? ptnMota,
    String? ptnCode,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if(giongTen != null){
      _giongTen = giongTen;
    }
    if(ptnMota != null){
      _ptnMota = ptnMota;
    }
    if(ptnCode != null){
      _ptnCode = ptnCode;
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
  String? get ptnMota => _ptnMota;
  String? get ptnCode => _ptnCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set giongTen(String? giongTen) => _giongTen = giongTen;
  set ptnMota(String? ptnMota) => _ptnMota = ptnMota;
  set ptnCode(String? ptnCode) => _ptnCode = ptnCode;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  maptnModel.fromJson(Map<String, dynamic>json){
    _id = json["id"];
    _giongTen = json["giong_ten"];
    _ptnMota = json["ptn_mota"]?? 'Chưa cập nhật';
    _ptnCode = json["ptn_code"]?? 'Chưa cập nhật';
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String, dynamic>{};
    data["id"] = _id;
    data["giong_ten"] = _giongTen;
    data["ptn_mota"] = _ptnMota;
    data["ptn_code"] = _ptnCode;
    data["created_at"] = _createdAt;
    data["updated_at"] = _updatedAt;
    return data;
  }
}