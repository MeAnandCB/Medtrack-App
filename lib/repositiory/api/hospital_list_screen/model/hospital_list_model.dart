class HospitalListResModel {
  int? status;
  List<HospitalListData>? hospitalListData;

  HospitalListResModel({
    this.status,
    this.hospitalListData,
  });

  factory HospitalListResModel.fromJson(Map<String, dynamic> json) =>
      HospitalListResModel(
        status: json["status"],
        hospitalListData: json["data"] == null
            ? []
            : List<HospitalListData>.from(json["data"]!.map((x) => HospitalListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": hospitalListData == null
            ? []
            : List<dynamic>.from(hospitalListData!.map((x) => x.toJson())),
      };
}

class HospitalListData {
  int? id;
  String? name;
  String? address;
  String? contactInformation;
  String? image;
  String? rating;

  HospitalListData({
    this.id,
    this.name,
    this.address,
    this.contactInformation,
    this.image,
    this.rating,
  });

  factory HospitalListData.fromJson(Map<String, dynamic> json) => HospitalListData(
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
