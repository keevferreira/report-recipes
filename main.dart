import 'dart:async';

import 'file_operations.dart';
import 'report_operations.dart';

Future<void> main() async {
  var files = ['arquivo2.txt', 'arquivo1.txt', 'arquivo3.txt'];

  var dataList = await FileOperations.readFiles(files);

  dataList.sort((a, b) => a.date.compareTo(b.date));

  var totalRevenue = dataList.fold<double>(
      0, (previousValue, element) => previousValue + element.revenue);
  var totalExpenses = dataList.fold<double>(
      0, (previousValue, element) => previousValue + element.expenses);
  var totalProfit = totalRevenue - totalExpenses;

  var startDate = dataList.first.date;
  var endDate = dataList.last.date;

  await ReportOperations.writeReport(
      startDate, endDate, totalRevenue, totalExpenses, totalProfit);
}