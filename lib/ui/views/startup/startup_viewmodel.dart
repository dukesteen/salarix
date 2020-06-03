import 'package:salarix/app/locator.dart';
import 'package:salarix/app/router.gr.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/services/salary_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends ReactiveViewModel {
  final SalaryService _salaryService = locator<SalaryService>();
  final NavigationService _navigationService = locator<NavigationService>();

  StartupViewModel() {
    print('StartupViewModel initialised');
  }

  String _welcomeMessage = "Welkom terug";
  String get welcomeMessage => _welcomeMessage;

  List<SalaryModel> get salaryModels => _salaryService.salaryModels;

  void navToSelf() {
    _navigationService.navigateTo(Routes.startupViewRoute);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_salaryService];
}
