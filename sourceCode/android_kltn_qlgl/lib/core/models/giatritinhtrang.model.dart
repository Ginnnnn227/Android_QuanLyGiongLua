class giatritinhtrangModel{
  int? _id;
  String? _ddttTen;
  String? _gtttDiem;
  String? _createdAt;
  String? _updatedAt;

  giatritinhtrangModel({
    int? id,
    String? ddttTen,
    String? gtttDiem,
    String? createdAt,
    String? updatedAt
  }){
    if(id != null){
      _id = id;
    }
    if (ddttTen != null) {
      _ddttTen = ddttTen;
    }
    if (gtttDiem != null) {
      _gtttDiem = gtttDiem;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  String? get ddttTen => _ddttTen;
  String? get gtttDiem => _gtttDiem;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set dtttTen(String? ddttTen) => _ddttTen = ddttTen;
  set dtttMota(String? gtttDiem) => _gtttDiem = gtttDiem;
  // set createdAt(String? createdAt) => _createdAt = createdAt;
  // set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  giatritinhtrangModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _ddttTen = json['dacdiemtt_ten'];
    _gtttDiem = json['giatritt_diem'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['dacdiemtt_ten'] = _ddttTen;
    data['giatritt_diem'] = _gtttDiem;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}