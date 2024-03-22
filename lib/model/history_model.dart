import 'package:hive_flutter/hive_flutter.dart';
part 'history_model.g.dart';

@HiveType(typeId: 1)
class HistoryModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String time;
  @HiveField(2)
  final date;
  @HiveField(3)
  final department;
  @HiveField(4)
  final fee;
  @HiveField(5)
  final image;

  HistoryModel({
    required this.name,
    required this.time,
    required this.date,
    required this.department,
    required this.fee,
    required this.image,
  });
}
