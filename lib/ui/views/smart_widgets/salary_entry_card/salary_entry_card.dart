import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salarix/models/salary_model.dart';
import 'package:salarix/styles.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/salary_entry_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SalaryEntryCard extends ViewModelWidget<SalaryModel> {
  final SalaryModel salaryModel;

  SalaryEntryCard({Key key, this.salaryModel}) : super(key: key);

  final DateFormat dateFormatter = DateFormat('MM/dd');

  final currencyFormatter = new NumberFormat("#,##0.00", "en_US");
  final currencyFormat1kPlus = new NumberFormat("#,##0", "en_US");

  @override
  Widget build(BuildContext context, SalaryModel model) {
    var currencyString;
    var salary = model.hourlyWage * model.hoursWorked;

    if (salary > 1000) {
      currencyString = currencyFormat1kPlus.format(salary);
    } else {
      currencyString = currencyFormatter.format(salary);
    }

    return ViewModelBuilder<SalaryEntryViewModel>.reactive(
      viewModelBuilder: () => SalaryEntryViewModel(salaryModel),
      builder: (context, model, child) => Dismissible(
        onDismissed: (direction) => {
          model.remove(model.salaryModel.id, context),
        },
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            color: UiColors.redSalsa,
          ),
          margin: EdgeInsets.only(bottom: 15.0, left: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.centerRight,
          child: Icon(Icons.delete, color: UiColors.white),
        ),
        key: key,
        confirmDismiss: (dismissDirection) async {
          return await model.showConfirmationDialog(context, 'remove') == true;
        },
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.0),
            ),
            margin: EdgeInsets.only(bottom: 15.0),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        dateFormatter.format(model.salaryModel.dateWorked),
                        style: UiTextStyles.montserrat20ptSemiBoldRed,
                      ),
                      Text(
                        '${model.salaryModel.hoursWorked} uren ',
                        style: UiTextStyles.montserrat16ptSemiBoldSpaceCadet,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      '€ ' + currencyString,
                      style: UiTextStyles.montserrat30ptBoldSpaceCadet,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
