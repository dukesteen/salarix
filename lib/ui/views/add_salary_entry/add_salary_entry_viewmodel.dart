import 'package:salarix/app/locator.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/services/salary_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddSalaryEntryViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SalaryService _salaryService = locator<SalaryService>();

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
}
