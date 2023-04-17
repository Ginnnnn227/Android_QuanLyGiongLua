class doituongtinhtrangModel{
  int? _id;
  String? _gdttTen;
  String? _dtttTen;
  String? _dtttMota;
  String? _createdAt;
  String? _updatedAt;

  doituongtinhtrangModel({
    int? id,
    String? gdttTen,
    String? dtttTen,
    String? dtttMota,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if (gdttTen != null) {
      _gdttTen = gdttTen;
    }
    if (dtttTen != null) {
      _dtttTen = dtttTen;
    }
    if (dtttMota != null) {
      _dtttMota = dtttMota;
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
  String? get dtttTen => _dtttTen;
  String? get dtttMota => _dtttMota;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set dtttTen(String? dtttTen) => _dtttTen = dtttTen;
  set dtttMota(String? dtttMota) => _dtttMota = dtttMota;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  doituongtinhtrangModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _gdttTen = json['giaidoantt_ten'];
    _dtttTen = json['doituongtt_ten'];
    _dtttMota = json['doituongtt_mota'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['giaidoantt_ten'] = _gdttTen;
    data['doituongtt_ten'] = _dtttTen;
    data['doituongtt_mota'] = _dtttMota;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}