import 'package:flutter/material.dart';
import 'package:salarix/ui/views/add_salary_entry/add_salary_entry_view.dart';
import 'package:stacked/stacked.dart';

class CustomBottomNavbarViewModel extends BaseViewModel {
  void showAddScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      backgroundColor: Colors.transparent,
      builder: (context) => AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: AddSalaryEntryView()),
    );
  }
}
