import 'package:salarix/app/locator.dart';
import 'package:salarix/app/router.gr.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/services/salary_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SalaryService _salaryService = locator<SalaryService>();

  void navigateToStartup() {
    _navigationService.navigateTo(Routes.startupViewRoute);
  }

  void addEntry() {
    print('called');
    _salaryService.add(
      SalaryModel(
        dateWorked: DateTime(2002),
        hourlyWage: 20.0,
        hoursWorked: 13.0,
      ),
    );
    notifyListeners();
  }

  void removeEntry() {
    _salaryService.remove();
    notifyListeners();
  }

  void back() {
    _navigationService.back();
    notifyListeners();
  }
}
