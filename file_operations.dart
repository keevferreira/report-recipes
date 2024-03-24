import 'dart:io';
import 'finance_data.dart';

class FileOperations {
	static Future<List<FinanceData>> readFiles(List<String> files) async {
		var dataList = <FinanceData>[];
		for (var file in files)	{
			var lines = await File(file).readAsLines();
			dataList.addAll(lines.skip(1).map((line) => FinanceData(line)));
		}
		return dataList;
	}
}
