class LoginResModel {
  int? status;
  Data? data;

  LoginResModel({
    this.status,
    this.data,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? refresh;
  String? access;
  String? username;
  String? email;
  bool? isSuperuser;
  bool? isPatient;

  Data({
    this.refresh,
    this.access,
    this.username,
    this.email,
    this.isSuperuser,
    this.isPatient,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        refresh: json["refresh"],
        access: json["access"],
        username: json["username"],
        email: json["email"],
        isSuperuser: json["is_superuser"],
        isPatient: json["is_patient"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "username": username,
        "email": email,
        "is_superuser": isSuperuser,
        "is_patient": isPatient,
      };
}
