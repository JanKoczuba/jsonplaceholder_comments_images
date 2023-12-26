#!/bin/bash
lcov -r coverage/lcov.info '*/__test*__/*' '*.freezed.dart' '*/infrastructure/*/model/*' '*_module.dart' '*main_*.dart' '*safe_print.dart' '*.gr.dart' '*.g.dart' '*_enum.dart' '*/di/*' -o coverage/lcov_cleaned.info && \
genhtml coverage/lcov_cleaned.info -o coverage/html