class chitieungoaidongModel {
  int? _id;
  String? _giongTen;
  String? _ctnd_PhienLa;
  String? _ctnd_TaiLa;
  String? _ctnd_Gocnhanh;
  String? _ctnd_BeLa;
  String? _ctnd_GocLa;
  String? _ctnd_MauSacGocLa;
  String? _ctnd_GocLaDong;
  String? _ctnd_ThoatCb;
  String? _ctnd_MauSacGocThan;
  String? _ctnd_DangBong;
  String? _ctnd_CongTrucBong;
  String? _ctnd_Rau;
  String? _createdAt;
  String? _updatedAt;

  chitieungoaidongModel(
      {int? id,
      String? giongTen,
      String? ctnd_PhienLa,
      String? ctnd_TaiLa,
      String? ctnd_Gocnhanh,
      String? ctnd_BeLa,
      String? ctnd_GocLa,
      String? ctnd_MauSacGocLa,
      String? ctnd_GocLaDong,
      String? ctnd_ThoatCb,
      String? ctnd_MauSacGocThan,
      String? ctnd_DangBong,
      String? ctnd_CongTrucBong,
      String? ctnd_Rau,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (giongTen != null) {
      _giongTen = giongTen;
    }
    if (ctnd_PhienLa != null) {
      _ctnd_PhienLa = ctnd_PhienLa;
    }
    if (ctnd_TaiLa != null) {
      _ctnd_TaiLa = ctnd_TaiLa;
    }
    if (ctnd_Gocnhanh != null) {
      _ctnd_Gocnhanh = ctnd_Gocnhanh;
    }
    if (ctnd_BeLa != null) {
      _ctnd_BeLa = ctnd_BeLa;
    }
    if (ctnd_GocLa != null) {
      _ctnd_GocLa = ctnd_GocLa;
    }
    if (ctnd_MauSacGocLa != null) {
      _ctnd_MauSacGocLa = ctnd_MauSacGocLa;
    }
    if (ctnd_GocLaDong != null) {
      _ctnd_GocLaDong = ctnd_GocLaDong;
    }
    if (ctnd_ThoatCb != null) {
      _ctnd_ThoatCb = ctnd_ThoatCb;
    }
    if (ctnd_MauSacGocThan != null) {
      _ctnd_MauSacGocThan = ctnd_MauSacGocThan;
    }
    if (ctnd_DangBong != null) {
      _ctnd_DangBong = ctnd_DangBong;
    }
    if (ctnd_CongTrucBong != null) {
      _ctnd_CongTrucBong = ctnd_CongTrucBong;
    }
    if (ctnd_Rau != null) {
      _ctnd_Rau = ctnd_Rau;
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
  String? get ctnd_PhienLa => _ctnd_PhienLa;
  String? get ctnd_TaiLa => _ctnd_TaiLa;
  String? get ctnd_Gocnhanh => _ctnd_Gocnhanh;
  String? get ctnd_BeLa => _ctnd_BeLa;
  String? get ctnd_GocLa => _ctnd_GocLa;
  String? get ctnd_MauSacGocLa => _ctnd_MauSacGocLa;
  String? get ctnd_GocLaDong => _ctnd_GocLaDong;
  String? get ctnd_ThoatCb => _ctnd_ThoatCb;
  String? get ctnd_MauSacGocThan => _ctnd_MauSacGocThan;
  String? get ctnd_DangBong => _ctnd_DangBong;
  String? get ctnd_CongTrucBong => _ctnd_CongTrucBong;
  String? get ctnd_Rau => _ctnd_Rau;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  //set id(int? id) => _id = id;
  set ctnd_PhienLa(String? ctnd_PhienLa) => _ctnd_PhienLa = ctnd_PhienLa;
  set ctnd_TaiLa(String? ctnd_TaiLa) => _ctnd_TaiLa = ctnd_TaiLa;
  set ctnd_Gocnhanh(String? ctnd_Gocnhanh) => _ctnd_Gocnhanh = ctnd_Gocnhanh;
  set ctnd_BeLa(String? ctnd_BeLa) => _ctnd_BeLa = ctnd_BeLa;
  set ctnd_GocLa(String? ctnd_GocLa) => _ctnd_GocLa = ctnd_GocLa;
  set ctnd_MauSacGocLa(String? ctnd_MauSacGocLa) =>
      _ctnd_MauSacGocLa = ctnd_MauSacGocLa;
  set ctnd_GocLaDong(String? ctnd_GocLaDong) =>
      _ctnd_GocLaDong = ctnd_GocLaDong;
  set ctnd_ThoatCb(String? ctnd_ThoatCb) => _ctnd_ThoatCb = ctnd_ThoatCb;
  set ctnd_MauSacGocThan(String? ctnd_MauSacGocThan) =>
      _ctnd_MauSacGocThan = ctnd_MauSacGocThan;
  set ctnd_DangBong(String? ctnd_DangBong) => _ctnd_DangBong = ctnd_DangBong;
  set ctnd_CongTrucBong(String? ctnd_CongTrucBong) =>
      _ctnd_CongTrucBong = ctnd_CongTrucBong;
  set ctnd_Rau(String? ctnd_Rau) => _ctnd_Rau = ctnd_Rau;
  //set createdAt(String? createdAt) => _createdAt = createdAt;
  //set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  chitieungoaidongModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _giongTen = json['giong_ten'];
    _ctnd_PhienLa = json['chitieungoaidong_phienla'];
    _ctnd_TaiLa = json['chitieungoaidong_taila'];
    _ctnd_Gocnhanh = json['chitieungoaidong_gocnhanh'];
    _ctnd_BeLa = json['chitieungoaidong_bela'];
    _ctnd_GocLa = json['chitieungoaidong_gocla'];
    _ctnd_MauSacGocLa = json['chitieungoaidong_msgocla'];
    _ctnd_GocLaDong = json['chitieungoaidong_gocladong'];
    _ctnd_ThoatCb = json['chitieungoaidong_thoatcb'];
    _ctnd_MauSacGocThan = json['chitieungoaidong_msgocthan'];
    _ctnd_DangBong = json['chitieungoaidong_dangbong'];
    _ctnd_CongTrucBong = json['chitieungoaidong_congtrucbong'];
    _ctnd_Rau = json['chitieungoaidong_rau'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['giong_ten'] = _giongTen;
    data['chitieungoaidong_phienla'] = _ctnd_PhienLa;
    data['chitieungoaidong_taila'] = _ctnd_TaiLa;
    data['chitieungoaidong_gocnhanh'] = _ctnd_Gocnhanh;
    data['chitieungoaidong_bela'] = _ctnd_BeLa;
    data['chitieungoaidong_gocla'] = _ctnd_GocLa;
    data['chitieungoaidong_msgocla'] = _ctnd_MauSacGocLa;
    data['chitieungoaidong_gocladong'] = _ctnd_GocLaDong;
    data['chitieungoaidong_thoatcb'] = _ctnd_ThoatCb;
    data['chitieungoaidong_msgocthan'] = _ctnd_MauSacGocThan;
    data['chitieungoaidong_dangbong'] = _ctnd_DangBong;
    data['chitieungoaidong_congtrucbong'] = _ctnd_CongTrucBong;
    data['chitieungoaidong_rau'] = _ctnd_Rau;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}
