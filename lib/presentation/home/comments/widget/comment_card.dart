import 'package:flutter/material.dart';

import '../../../../domain/comments/entity/comment.dart';
import '../../../resource/app_color.dart';
import '../../../resource/app_padding.dart';
import '../../../resource/app_text_style.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    required this.comment,
    Key? key,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.commentCardBackground,
      elevation: 0,
      child: Padding(
        padding: AppPadding.cardMargin,
        child: Column(
          children: [
            Text(
              comment.name,
              style: AppTextStyle.commentName,
            ),
            const SizedBox(height: 4),
            Text(
              comment.email,
              style: AppTextStyle.commentEmail,
            ),
            const SizedBox(height: 8),
            Text(
              comment.body,
              style: AppTextStyle.commentBody,
            ),
          ],
        ),
      ),
    );
  }
}
