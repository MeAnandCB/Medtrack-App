class ProfileResModel {
  int? status;
  Profile? profileData;

  ProfileResModel({
    this.status,
    this.profileData,
  });

  factory ProfileResModel.fromJson(Map<String, dynamic> json) =>
      ProfileResModel(
        status: json["status"],
        profileData:
            json["data"] == null ? null : Profile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": profileData?.toJson(),
      };
}

class Profile {
  int? id;
  User? user;
  String? name;
  DateTime? dob;
  String? gender;
  String? phoneNumber;

  Profile({
    this.id,
    this.user,
    this.name,
    this.dob,
    this.gender,
    this.phoneNumber,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        name: json["name"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "name": name,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone_number": phoneNumber,
      };
}

class User {
  String? username;
  String? email;

  User({
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
      };
}
