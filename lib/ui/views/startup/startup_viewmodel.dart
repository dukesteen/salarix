import 'package:salarix/app/locator.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/services/salary_service.dart';
import 'package:stacked/stacked.dart';

class StartupViewModel extends ReactiveViewModel {
  final SalaryService _salaryService = locator<SalaryService>();

  String _welcomeMessage = "Welkom terug";
  String get welcomeMessage => _welcomeMessage;

  List<SalaryModel> get salaryModels => _salaryService.salaryModels;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_salaryService];
}
