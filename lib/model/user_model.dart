// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//UserModel sınıfı oluşturuldu
class UserModel {
  String? uid;
  String? email;
  String? name;
  String? surname;
  String? username;
  String? profilPhoto;
  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.surname,
    required this.username,
    this.profilPhoto,
  });
//Kullanıcı bilgilerini güncelleme işlemi
  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    String? surname,
    String? username,
    String? profilPhoto,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      username: username ?? this.username,
      profilPhoto: profilPhoto ?? this.profilPhoto,
    );
  }

//Firebase Firestore'dan gelen veriyi map'e çevirme işlemi
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'name': name,
      'surname': surname,
      'username': username,
      'profilPhoto': profilPhoto,
    };
  }

//Firebase Firestore'dan gelen veriyi çekme işlemi
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      surname: map['surname'] != null ? map['surname'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      profilPhoto: map['profilPhoto'] != null ? map['profilPhoto'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, name: $name, surname: $surname, username: $username, profilPhoto: $profilPhoto)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.email == email &&
        other.name == name &&
        other.surname == surname &&
        other.username == username &&
        other.profilPhoto == profilPhoto;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ email.hashCode ^ name.hashCode ^ surname.hashCode ^ username.hashCode ^ profilPhoto.hashCode;
  }
}
