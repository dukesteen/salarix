import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class SalaryService with ReactiveServiceMixin {
  SalaryService() {
    listenToReactiveValues([_salaryModels]);
  }

  RxList<SalaryModel> _salaryModels = RxList<SalaryModel>();
  RxList<SalaryModel> get salaryModels => _salaryModels;

  void add(SalaryModel model) {
    _salaryModels.add(model);
  }

  void remove(String uuid) {
    print('removed (inside service)');
    _salaryModels.removeWhere((element) => element.id == uuid);
  }
}
