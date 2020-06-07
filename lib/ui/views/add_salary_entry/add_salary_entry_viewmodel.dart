import 'package:flutter/material.dart';
import 'package:salarix/app/locator.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/services/salary_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddSalaryEntryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SalaryService _salaryService = locator<SalaryService>();
  final DialogService _dialogService = locator<DialogService>();

  final hoursWorkedController = TextEditingController();
  final hourlyWageController = TextEditingController();

  SalaryModel _salaryModel = SalaryModel(dateWorked: DateTime.now());
  SalaryModel get salaryModel => _salaryModel;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_salaryService];

  void setDateWorked(DateTime time) {
    _salaryModel.dateWorked = time;
    notifyListeners();
  }

  void navBack() {
    _navigationService.back();
  }

  void initModel() {
    print('AddSalaryEntryViewModel initialised');
    hoursWorkedController.addListener(_hoursWorkedUpdate);
    hourlyWageController.addListener(_hourlyWageUpdate);
    notifyListeners();
  }

  void _hoursWorkedUpdate() {
    _salaryModel.hoursWorked =
        num.tryParse(hoursWorkedController.text)?.toDouble();
    notifyListeners();
  }

  void _hourlyWageUpdate() {
    salaryModel.hourlyWage =
        num.tryParse(hourlyWageController.text)?.toDouble();
    notifyListeners();
  }

  void submitModel() {
    if (salaryModel.hoursWorked == null ||
        salaryModel.hourlyWage == null ||
        salaryModel.dateWorked == null) {
      _dialogService.showDialog(
        title: "Error occured",
        description: "Please fill out the entire form.",
        buttonTitle: "OK",
      );
    } else {
      _salaryService.add(salaryModel);
      notifyListeners();
      navBack();
    }
  }
}
