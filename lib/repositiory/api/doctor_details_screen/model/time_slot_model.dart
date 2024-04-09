class TimeSlotResModel {
  int? status;
  List<TimeSlot>? timeSlotData;

  TimeSlotResModel({
    this.status,
    this.timeSlotData,
  });

  factory TimeSlotResModel.fromJson(Map<String, dynamic> json) =>
      TimeSlotResModel(
        status: json["status"],
        timeSlotData: json["data"] == null
            ? []
            : List<TimeSlot>.from(
                json["data"]!.map((x) => TimeSlot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": timeSlotData == null
            ? []
            : List<dynamic>.from(timeSlotData!.map((x) => x.toJson())),
      };
}

class TimeSlot {
  String? time;
  bool? isBooked;

  TimeSlot({
    this.time,
    this.isBooked,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        time: json["time"],
        isBooked: json["is_booked"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "is_booked": isBooked,
      };
}
