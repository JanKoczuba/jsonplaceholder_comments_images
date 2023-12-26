#!/bin/bash
./generate_coverage_helper_test_file.sh jsonplaceholder_comments_images && \
flutter test --coverage ./lib && \
./generate-report.sh