class DepartmentListResModel {
  int? status;
  List<Department>? departmentData;

  DepartmentListResModel({
    this.status,
    this.departmentData,
  });

  factory DepartmentListResModel.fromJson(Map<String, dynamic> json) =>
      DepartmentListResModel(
        status: json["status"],
        departmentData: json["data"] == null
            ? []
            : List<Department>.from(
                json["data"]!.map((x) => Department.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": departmentData == null
            ? []
            : List<dynamic>.from(departmentData!.map((x) => x.toJson())),
      };
}

class Department {
  int? id;
  Hospital? hospital;
  String? departmentName;
  String? image;

  Department({
    this.id,
    this.hospital,
    this.departmentName,
    this.image,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"],
        hospital: json["hospital"] == null
            ? null
            : Hospital.fromJson(json["hospital"]),
        departmentName: json["department_name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital": hospital?.toJson(),
        "department_name": departmentName,
        "image": image,
      };
}

class Hospital {
  int? id;
  String? name;
  String? address;
  String? contactInformation;
  String? image;
  String? rating;

  Hospital({
    this.id,
    this.name,
    this.address,
    this.contactInformation,
    this.image,
    this.rating,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        contactInformation: json["contact_information"],
        image: json["image"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "contact_information": contactInformation,
        "image": image,
        "rating": rating,
      };
}
