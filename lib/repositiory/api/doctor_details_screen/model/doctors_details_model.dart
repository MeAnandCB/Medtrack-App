class DoctorDetailstResModel {
  int? status;
  Details? doctorDetail;

  DoctorDetailstResModel({
    this.status,
    this.doctorDetail,
  });

  factory DoctorDetailstResModel.fromJson(Map<String, dynamic> json) =>
      DoctorDetailstResModel(
        status: json["status"],
        doctorDetail:
            json["data"] == null ? null : Details.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": doctorDetail?.toJson(),
      };
}

class Details {
  int? id;
  String? name;
  String? specialization;
  String? degree;
  String? image;
  String? description;
  int? experience;
  dynamic rating;
  int? hospitalAndDepartment;

  Details({
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

  factory Details.fromJson(Map<String, dynamic> json) => Details(
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
