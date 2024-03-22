import 'package:hive_flutter/hive_flutter.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 1)
class ProfileModel {
  @HiveField(0)
  final String fullname;
  @HiveField(1)
  final String mobile;
  @HiveField(2)
  final dob;
  @HiveField(3)
  final gender;
  @HiveField(4)
  final user;

  ProfileModel({
    required this.fullname,
    required this.mobile,
    required this.dob,
    required this.gender,
    required this.user,
  });
}
