import 'package:flutter/material.dart';
import 'package:salarix/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: model.back,
              child: Text('Back to home'),
            ),
            FlatButton(
              onPressed: model.addEntry,
              child: Text('Add item'),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
