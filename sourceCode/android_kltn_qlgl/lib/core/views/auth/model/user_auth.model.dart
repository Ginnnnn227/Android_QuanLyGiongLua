class UserAuthModel {
  int? _id;
  String? _name;
  String? _email;
  String? _address;
  String? _phone;

  UserAuthModel({
    final int? id,
  final String? name,
  final String? email,
  final String? address,
  final String? phone
  }){
    if(id != null){
      _id = id;
    }
    if(name != null){
      _name = name;
    }
    if(email != null){
      _email = email;
    }
    if(address != null){
      _address = address;
    }
    if(phone != null){
      _phone = phone;
    }
  }

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get address => _address;
  String? get phone => _phone;
  
  UserAuthModel.fromJson(Map<String, dynamic>json){
    _id = json["id"];
    _name = json["name"];
    _email = json["email"];
    _address = json["adress"];
    _phone = json["phone"];
  }
}