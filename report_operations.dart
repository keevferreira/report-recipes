import 'dart:io';

class ReportOperations {
  static Future<void> writeReport(DateTime startDate, DateTime endDate,
      double totalRevenue, double totalExpenses, double totalProfit) async {
    var reportFile = File('relatorio.txt');

    await reportFile.writeAsString('Relatório Financeiro da Empresa\n\n');
    await reportFile.writeAsString(
        'Período Analisado: ${startDate.day}/${startDate.month}/${startDate.year} - ${endDate.day}/${endDate.month}/${endDate.year}\n\n');
    await reportFile.writeAsString(
        'Total de Receitas: R\$ ${totalRevenue.toStringAsFixed(2)}\n', mode: FileMode.append);
    await reportFile.writeAsString(
        'Total de Despesas: R\$ ${totalExpenses.toStringAsFixed(2)}\n', mode: FileMode.append);
    await reportFile.writeAsString(
        'Lucro Total: R\$ ${totalProfit.toStringAsFixed(2)}\n', mode: FileMode.append);
  }
}