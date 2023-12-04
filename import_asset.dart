import 'dart:io';

void main(List<String> args) {
  var file = File('assets/data.json');
  var data = file.readAsStringSync();
  var dartFile = File('lib/models/imported_data.dart');
  dartFile.writeAsStringSync("const data = $data;");
}
