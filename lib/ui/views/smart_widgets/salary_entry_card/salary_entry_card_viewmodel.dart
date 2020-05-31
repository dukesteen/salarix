import 'package:flutter/material.dart';
import 'package:salarix/app/locator.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/services/salary_service.dart';
import 'package:stacked/stacked.dart';

class SalaryEntryViewModel extends ReactiveViewModel {
  final SalaryService _salaryService = locator<SalaryService>();

  final SalaryModel salaryModel;
  SalaryEntryViewModel(this.salaryModel);

  void remove(String uuid) {
    print('removed');
    _salaryService.remove(uuid);
    //notifyListeners();
  }

  Future<bool> showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to $action this item?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pop(context, true); // showDialog() returns true
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context, false); // showDialog() returns false
              },
            ),
          ],
        );
      },
    );
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_salaryService];
}
