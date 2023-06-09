import 'package:flutter/material.dart';

import '../../../utils/context_extension.dart';
import '../../core/default_error_widget.dart';
import '../../resource/app_padding.dart';

class NoInternetConnectionPage extends StatelessWidget {
  const NoInternetConnectionPage({
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.page,
        child: DefaultErrorWidget(
          message: context.localizations.noInternetConnection,
          onRefresh: onRefresh,
        ),
      ),
    );
  }
}
