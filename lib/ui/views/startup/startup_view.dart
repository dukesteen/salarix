import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salarix/styles.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/custom_bottom_navbar/custom_bottom_navbar.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/salary_entry_card.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/stat_card/stat_card.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/stat_card/stat_card_types.dart';
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
                          Provider.value(
                            value: StatCardTypes.HOURS,
                            child: StatCard(
                              cardType: StatCardTypes.HOURS,
                            ),
                          ),
                          Provider.value(
                            value: StatCardTypes.SALARY,
                            child: StatCard(
                              cardType: StatCardTypes.SALARY,
                            ),
                          ),
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
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          print('rebuilt list (index: $index)');
                          return Provider.value(
                            value: model.salaryModels[index],
                            child: SalaryEntryCard(
                              salaryModel: model.salaryModels[index],
                              key: UniqueKey(),
                            ),
                          );
                        },
                        itemCount: model.salaryModels.length,
                      )),
                ),
              )
            ],
          ),
          bottomNavigationBar: CustomBottomNavbar(),
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
