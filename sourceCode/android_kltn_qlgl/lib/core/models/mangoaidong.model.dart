class mangoaidongModel{
  int? _id;
  String? _giongTen;
  String? _fieldMota;
  String? _fieldCode;
  String? _createdAt;
  String? _updatedAt;

  mangoaidongModel({
    int? id,
    String? giongTen,
    String? fieldMota,
    String? fieldCode,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if(giongTen != null){
      _giongTen = giongTen;
    }
    if(fieldMota != null){
      _fieldMota = fieldMota;
    }
    if(fieldCode != null){
      _fieldCode = fieldCode;
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
  String? get fieldMota => _fieldMota;
  String? get fieldCode => _fieldCode;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set giongTen(String? giongTen) => _giongTen = giongTen;
  set fieldMota(String? fieldMota) => _fieldMota = fieldMota;
  set fieldCode(String? fieldCode) => _fieldCode = fieldCode;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  mangoaidongModel.fromJson(Map<String, dynamic>json){
    _id = json["id"];
    _giongTen = json["giong_ten"];
    _fieldMota = json["field_mota"]?? 'Chưa cập nhật';
    _fieldCode = json["field_code"]?? 'Chưa cập nhật';
    _createdAt = json["created_at"];
    _updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String, dynamic>{};
    data["id"] = _id;
    data["giong_ten"] = _giongTen;
    data["field_mota"] = _fieldMota;
    data["field_code"] = _fieldCode;
    data["created_at"] = _createdAt;
    data["updated_at"] = _updatedAt;
    return data;
  }
}