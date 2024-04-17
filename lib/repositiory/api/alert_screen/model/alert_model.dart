 
class AlertResModel {
  int? status;
  List<ResAlert>? data;

  AlertResModel({
    this.status,
    this.data,
  });

  factory AlertResModel.fromJson(Map<dynamic, dynamic> json) => AlertResModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<ResAlert>.from(
                json["data"]!.map((x) => ResAlert.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ResAlert {
  String? message;

  ResAlert({
    this.message,
  });

  factory ResAlert.fromJson(Map<dynamic, dynamic> json) => ResAlert(
        message: json["message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "message": message,
      };
}
