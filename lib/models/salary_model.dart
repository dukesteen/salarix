import 'package:uuid/uuid.dart';

class SalaryModel {
  static var uuid = Uuid();

  String id = uuid.v4();
  DateTime dateWorked;
  double hoursWorked;
  double hourlyWage;

  SalaryModel({this.dateWorked, this.hoursWorked, this.hourlyWage});
}
