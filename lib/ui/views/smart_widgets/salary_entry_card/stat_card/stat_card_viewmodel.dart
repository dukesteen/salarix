import 'package:intl/intl.dart';
import 'package:salarix/app/locator.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/services/salary_service.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/stat_card/stat_card_types.dart';
import 'package:stacked/stacked.dart';

class StatCardViewModel extends ReactiveViewModel {
  SalaryService _salaryService = locator<SalaryService>();
  final currencyFormatter = new NumberFormat("#,##0.00", "en_US");

  String _title;
  String get title => _title;

  List<SalaryModel> get salaryModels => _salaryService.salaryModels;

  String get dataToDisplay {
    if (cardType == StatCardTypes.SALARY) {
      print('[DataToDisplay(Salary) called');
      return '€ ' +
          currencyFormatter.format(salaryModels.fold(
              0,
              (previousValue, element) =>
                  previousValue + (element.hoursWorked * element.hourlyWage)));
    } else if (cardType == StatCardTypes.HOURS) {
      print('[DataToDisplay(Hours)] called');
      return salaryModels
          .fold(0,
              (previousValue, element) => previousValue + element.hoursWorked)
          .toString();
    }
    return null;
  }

  final StatCardTypes cardType;
  StatCardViewModel({this.cardType}) {
    print('StatCard initialised');
    if (cardType == StatCardTypes.SALARY) {
      _title = 'Totaal bedrag';
    } else if (cardType == StatCardTypes.HOURS) {
      _title = 'Totaal uren';
    }
    notifyListeners();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_salaryService];
}
