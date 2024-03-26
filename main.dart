import 'dart:async';

import 'file_operations.dart';
import 'report_operations.dart';

Future<void> main() async {
  var files = ['arquivo1.txt', 'arquivo2.txt', 'arquivo3.txt'];

  var dataList = await FileOperations.readFiles(files);

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