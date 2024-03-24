class FinanceData {
  late DateTime date;
  late double revenue;
  late double expenses;

  FinanceData(String line) {
    var values = line.split(', ');
    var dateParts = values[0].split('/');
    date = DateTime(int.parse(dateParts[2]), int.parse(dateParts[1]), int.parse(dateParts[0]));
    revenue = double.parse(values[1]);
    expenses = double.parse(values[2]);
  }
}