class UserModel {
  String id;
  String userName;
  String? email;

  UserModel({required this.id, required this.userName, this.email});

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      userName: json['username'] as String,
      email: json['email']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'username': userName,
        'email': email,
      };
}
