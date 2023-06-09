import 'dart:convert';

import '../fixtures/fixture_reader.dart';

dynamic jsonDecodeFile(String fileName) {
  final json = fixture(fileName);
  return jsonDecode(json);
}
