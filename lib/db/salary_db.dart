class SalaryDatabase {
  static const String TABLE_SALARY = "salaryEntries";
  static const String COLUMN_ID = "id";
  static const String COLUMN_HOURSWORKED = "hoursWorked";
  static const String COLUMN_DATEWORKED = "dateWorked";
  static const String COLUMN_HOURLYWAGE = "hourlyWage";

  SalaryDatabase._();
  static final SalaryDatabase db = SalaryDatabase._();

  Database _database;
}
