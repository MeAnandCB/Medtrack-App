class BookingHistoryResModel {
  int? status;
  List<History>? historyRes;

  BookingHistoryResModel({
    this.status,
    this.historyRes,
  });

  factory BookingHistoryResModel.fromJson(Map<String, dynamic> json) =>
      BookingHistoryResModel(
        status: json["status"],
        historyRes: json["data"] == null
            ? []
            : List<History>.from(json["data"]!.map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": historyRes == null
            ? []
            : List<dynamic>.from(historyRes!.map((x) => x.toJson())),
      };
}

class History {
  int? id;
  Doctor? doctor;
  DateTime? day;
  String? time;
  String? amount;
  DateTime? timeCreated;
  int? user;

  History({
    this.id,
    this.doctor,
    this.day,
    this.time,
    this.amount,
    this.timeCreated,
    this.user,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["id"],
        doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        time: json["time"],
        amount: json["amount"],
        timeCreated: json["time_created"] == null
            ? null
            : DateTime.parse(json["time_created"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor": doctor?.toJson(),
        "day":
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "time": time,
        "amount": amount,
        "time_created": timeCreated?.toIso8601String(),
        "user": user,
      };
}

class Doctor {
  int? id;
  String? name;
  String? specialization;
  String? degree;
  String? image;
  String? description;
  int? experience;
  dynamic rating;
  int? hospitalAndDepartment;

  Doctor({
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

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
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
