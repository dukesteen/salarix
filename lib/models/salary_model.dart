import 'package:uuid/uuid.dart';

class SalaryModel {
  static var uuid = Uuid();

  String id = uuid.v4();
  DateTime dateWorked;
  double hoursWorked;
  double hourlyWage;

  SalaryModel({this.dateWorked, this.hoursWorked, this.hourlyWage});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "id": id,
      "dateWorked": dateWorked,
      "hoursWorked": hoursWorked,
      "hourlyWage": hourlyWage,
    };

    return map;
  }

  SalaryModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    dateWorked = map["dateWorked"];
    hoursWorked = map["hoursWorked"];
    hourlyWage = map["hourlyWage"];
  }
}
