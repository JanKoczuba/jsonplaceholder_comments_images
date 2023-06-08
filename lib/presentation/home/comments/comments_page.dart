import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('CommentsPage'),
      ),
    );
  }
}
