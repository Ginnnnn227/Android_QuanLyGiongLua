class KieuHinhModel {
  final int id;
  final String kieuhinhTen;
  final String? kieuhinhMota;
  //final DateTime createdAt;
  //final DateTime updatedAt;

  KieuHinhModel({
    required this.id,
    required this.kieuhinhTen,
    required this.kieuhinhMota,
    //required this.createdAt,
    //required this.updatedAt,
  });

  factory KieuHinhModel.fromJson(Map<String, dynamic> json) {
    return KieuHinhModel(
      id: json['id'],
      kieuhinhTen: json['kieuhinh_ten'],
      kieuhinhMota: json['kieuhinh_mota'],
      //createdAt: DateTime.parse(json['created_at']),
      //updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}