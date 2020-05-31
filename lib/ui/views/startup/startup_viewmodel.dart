import 'package:salarix/app/locator.dart';
import 'package:salarix/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToHome() async {
    _navigationService.navigateTo(Routes.homeViewRoute);
  }
}
