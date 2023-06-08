import 'package:flutter/foundation.dart';

void safePrint(Object object, [String? tag]) {
  if (kDebugMode) {
    print(
        "${tag != null ? "[${tag.toUpperCase()}]" : ''}[${DateTime.now()}]: $object");
  }
}
