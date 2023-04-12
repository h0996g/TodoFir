class UserModel {
  String? name;
  String? uid;
  String? email;
  String? phone;
  String? img;
  String? departement;
  // bool? isEmailVerified;
  UserModel(
      {this.uid, this.name, this.email, this.phone, this.img, this.departement
      // this.isEmailVerified
      });
  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    departement = json['departement'];

    img = json['img'];
    // isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'email': email,
      'departement': departement,

      'img': img
      // 'isEmailVerified': isEmailVerified
    };
  }
}
