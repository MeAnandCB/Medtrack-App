
import 'dart:convert';

DoctorsListResModel doctorsListResModelFromJson(String str) =>
    DoctorsListResModel.fromJson(json.decode(str));

String doctorsListResModelToJson(DoctorsListResModel data) =>
    json.encode(data.toJson());

class DoctorsListResModel {
  int? status;
  List<DoctorsList>? doctorsListRes;

  DoctorsListResModel({
    this.status,
    this.doctorsListRes,
  });

  factory DoctorsListResModel.fromJson(Map<String, dynamic> json) =>
      DoctorsListResModel(
        status: json["status"],
        doctorsListRes: json["data"] == null
            ? []
            : List<DoctorsList>.from(
                json["data"]!.map((x) => DoctorsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": doctorsListRes == null
            ? []
            : List<dynamic>.from(doctorsListRes!.map((x) => x.toJson())),
      };
}

class DoctorsList {
  int? id;
  String? name;
  String? specialization;
  String? degree;
  String? image;
  String? description;
  int? experience;
  String? rating;
  int? hospitalAndDepartment;

  DoctorsList({
    this.id,
    this.name,
    this.specialization,
    this.degree,
    this.image,
    this.description,
    this.experience,
    this.rating,
    this.hospitalAndDepartment,
  });

  factory DoctorsList.fromJson(Map<String, dynamic> json) => DoctorsList(
        id: json["id"],
        name: json["name"],
        specialization: json["specialization"],
        degree: json["degree"],
        image: json["image"],
        description: json["description"],
        experience: json["experience"],
        rating: json["rating"],
        hospitalAndDepartment: json["hospital_and_department"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "specialization": specialization,
        "degree": degree,
        "image": image,
        "description": description,
        "experience": experience,
        "rating": rating,
        "hospital_and_department": hospitalAndDepartment,
      };
}
