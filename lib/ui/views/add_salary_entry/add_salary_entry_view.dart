import 'package:flutter/material.dart';
import 'package:salarix/styles.dart';
import 'package:salarix/ui/views/add_salary_entry/add_salary_entry_viewmodel.dart';
import 'package:stacked/stacked.dart';

class AddSalaryEntryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddSalaryEntryViewModel>.reactive(
      viewModelBuilder: () => AddSalaryEntryViewModel(),
      onModelReady: (model) => model.initModel(),
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(22.0),
          ),
          color: UiColors.spaceCadet,
        ),
        margin: EdgeInsets.symmetric(horizontal: 36.0),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Date worked ----------------------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Date worked',
                  style: UiTextStyles.montserrat16ptSemiBoldWhite,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    color: UiColors.white,
                  ),
                  width: 120.0,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.0,
                    ),
                    onPressed: () async {
                      DateTime tempDateTime = await showDatePicker(
                        context: context,
                        initialDate:
                            model.salaryModel.dateWorked ?? DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      model.setDateWorked(tempDateTime);
                    },
                    child: (model.salaryModel.dateWorked == null)
                        ? Text('Pick',
                            style: UiTextStyles.montserrat16ptSemiBoldRed)
                        : Text(
                            '${model.salaryModel.dateWorked.month}/${model.salaryModel.dateWorked.day}',
                            style: UiTextStyles.montserrat16ptSemiBoldRed,
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            // Hours worked ----------------------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hours worked',
                  style: UiTextStyles.montserrat16ptSemiBoldWhite,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    color: UiColors.white,
                  ),
                  width: 120.0,
                  child: TextFormField(
                    controller: model.hoursWorkedController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: '0.0',
                      hintStyle: UiTextStyles.montserrat16ptSemiBoldRed,
                      filled: true,
                      contentPadding: EdgeInsets.all(14),
                      fillColor: UiColors.white,
                    ),
                    textAlign: TextAlign.center,
                    style: UiTextStyles.montserrat16ptSemiBoldRed,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            // Hourly wage ----------------------------------------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Hourly wage',
                  style: UiTextStyles.montserrat16ptSemiBoldWhite,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    color: UiColors.white,
                  ),
                  width: 120.0,
                  child: TextFormField(
                    controller: model.hourlyWageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      hintText: '0.0',
                      hintStyle: UiTextStyles.montserrat16ptSemiBoldRed,
                      filled: true,
                      contentPadding: EdgeInsets.all(14),
                      fillColor: UiColors.white,
                    ),
                    textAlign: TextAlign.center,
                    style: UiTextStyles.montserrat16ptSemiBoldRed,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    color: UiColors.redSalsa,
                  ),
                  child: FlatButton(
                    onPressed: model.submitModel,
                    child: Text(
                      'Add',
                      style: UiTextStyles.montserrat16ptSemiBoldWhite,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
