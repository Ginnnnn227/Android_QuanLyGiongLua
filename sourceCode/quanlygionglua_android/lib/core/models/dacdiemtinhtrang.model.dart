// ignore_for_file: camel_case_types, unnecessary_getters_setters

class dacdiemtinhtrangModel{
  int? _id;
  String? _dtttTen;
  String? _ddttTen;
  String? _createdAt;
  String? _updatedAt;

  dacdiemtinhtrangModel({
    int? id,
    String? dtttTen,
    String? ddttTen,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if (dtttTen != null) {
      _dtttTen = dtttTen;
    }
    if (ddttTen != null) {
      _ddttTen = ddttTen;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get dtttTen => _dtttTen;
  String? get ddttTen => _ddttTen;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set dtttTen(String? dtttTen) => _dtttTen = dtttTen;
  set dtttMota(String? ddttTen) => _ddttTen = ddttTen;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  dacdiemtinhtrangModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _dtttTen = json['doituongtt_ten'];
    _ddttTen = json['dacdiemtt_ten'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['doituongtt_ten'] = _dtttTen;
    data['dacdiemtt_ten'] = _ddttTen;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}