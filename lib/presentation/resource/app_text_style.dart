import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppTextStyle {
  static const commentName = TextStyle(
    fontSize: 20,
    color: AppColor.commentName,
    fontWeight: FontWeight.w800,
  );
  static const commentEmail = TextStyle(
    fontSize: 12,
    color: AppColor.commentEmail,
    fontWeight: FontWeight.w400,
  );
  static const commentBody = TextStyle(
    fontSize: 16,
    color: AppColor.commentBody,
    fontWeight: FontWeight.w600,
  );
}
