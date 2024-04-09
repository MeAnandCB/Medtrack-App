class BookAppoinmentResModel {
  int? status;
  appoinment? appoinmentResData;

  BookAppoinmentResModel({
    this.status,
    this.appoinmentResData,
  });

  factory BookAppoinmentResModel.fromJson(Map<String, dynamic> json) =>
      BookAppoinmentResModel(
        status: json["status"],
        appoinmentResData:
            json["data"] == null ? null : appoinment.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": appoinmentResData?.toJson(),
      };
}

class appoinment {
  int? id;
  DateTime? day;
  String? time;
  DateTime? timeCreated;
  int? user;
  int? doctor;

  appoinment({
    this.id,
    this.day,
    this.time,
    this.timeCreated,
    this.user,
    this.doctor,
  });

  factory appoinment.fromJson(Map<String, dynamic> json) => appoinment(
        id: json["id"],
        day: json["day"] == null ? null : DateTime.parse(json["day"]),
        time: json["time"],
        timeCreated: json["time_created"] == null
            ? null
            : DateTime.parse(json["time_created"]),
        user: json["user"],
        doctor: json["doctor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "day":
            "${day!.year.toString().padLeft(4, '0')}-${day!.month.toString().padLeft(2, '0')}-${day!.day.toString().padLeft(2, '0')}",
        "time": time,
        "time_created": timeCreated?.toIso8601String(),
        "user": user,
        "doctor": doctor,
      };
}
