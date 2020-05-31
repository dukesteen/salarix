import 'package:flutter/material.dart';
import 'package:salarix/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Startup View'),
                FlatButton(
                  onPressed: model.navigateToHome,
                  child: Text('Go to home'),
                )
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
