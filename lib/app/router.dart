import 'package:auto_route/auto_route_annotations.dart';
import 'package:salarix/ui/views/startup/startup_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  StartupView startupViewRoute;
}
