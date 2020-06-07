import 'package:flutter/material.dart';
import 'package:salarix/styles.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/stat_card/stat_card_types.dart';
import 'package:salarix/ui/views/smart_widgets/salary_entry_card/stat_card/stat_card_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StatCard extends StatelessWidget {
  final StatCardTypes cardType;

  StatCard({Key key, this.cardType});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatCardViewModel>.reactive(
      viewModelBuilder: () => StatCardViewModel(cardType: cardType),
      builder: (context, model, child) => Container(
        //width: 190.0,
        height: 120.0,
        child: Card(
          margin: EdgeInsets.only(
            left: 19.0,
            bottom: 28.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 18.0, top: 18.0, right: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  model.title,
                  style: UiTextStyles.montserrat16ptSemiBoldRed,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    model.dataToDisplay.toString(),
                    style: UiTextStyles.montserrat30ptBoldSpaceCadet,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
