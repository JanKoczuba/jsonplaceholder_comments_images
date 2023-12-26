#!/bin/bash
file=test/coverage_helper_test.dart
grep -r --include=\*.dart -L 'part of' --exclude={generated_plugin_registrant.dart,main.dart,shared_preferences_module.dart,di.config.dart,di.dart,**_module.dart} lib | cut -c4- | awk -v package=$1 '{printf "import '\''package:%s%s'\''; // ignore: unused_import\n", package, $1}' > $file
echo "void main(){}" >> $file