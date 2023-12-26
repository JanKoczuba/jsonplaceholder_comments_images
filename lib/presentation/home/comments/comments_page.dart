import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../resource/app_padding.dart';
import 'widget/comments.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.page,
          child: Comments(),
        ),
      ),
    );
  }
}
