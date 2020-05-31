import 'package:flutter/material.dart';
import 'package:salarix/styles.dart';
import 'package:salarix/ui/views/home/home_view.dart';
import 'package:salarix/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                color: UiColors.spaceCadet,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(19.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            model.welcomeMessage,
                            style: UiTextStyles.montserrat27ptSemiBoldWhite,
                          ),
                          Icon(
                            Icons.settings,
                            color: UiColors.white,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Container(
                      height: 120.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(
                                        child: HomeView(),
                                      ));
                            },
                            child: Text(
                              'Go to add page',
                              style: UiTextStyles.montserrat16ptSemiBoldWhite,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                height: 250.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: UiColors.backgroundGrey,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 35.0,
                      top: 40.0,
                      right: 35.0,
                    ),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverList(
                          delegate: SliverChildListDelegate(
                            model.salaryModels
                                .map((e) => Text(
                                      '${e.dateWorked.toString()}, ${e.hoursWorked}, ${e.hourlyWage}',
                                      style: UiTextStyles
                                          .montserrat16ptSemiBoldSpaceCadet,
                                    ))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
