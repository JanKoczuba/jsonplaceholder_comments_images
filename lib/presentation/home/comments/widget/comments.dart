import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../app/constants.dart';
import '../../../../di/di.dart';
import '../../../../domain/comments/entity/comment.dart';
import '../../../../domain/comments/use_case/get_comments_use_case.dart';
import '../../../../utils/context_extension.dart';
import '../../../core/default_error_widget.dart';
import 'comment_card.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final PagingController<int, Comment> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);

    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final newPhotos = await getIt<GetCommentsUseCase>().execute(pageKey);
    newPhotos.fold(
      (l) => _pagingController.error = l,
      (photos) {
        final isLastPage = photos.length < Constants.commentsItemLimit;
        if (isLastPage) {
          _pagingController.appendLastPage(photos);
        } else {
          pageKey++;
          _pagingController.appendPage(photos, pageKey);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Comment>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Comment>(
          firstPageErrorIndicatorBuilder: (context) => _paginationErrorWidget(),
          newPageErrorIndicatorBuilder: (context) => _paginationErrorWidget(),
          itemBuilder: (context, comment, index) => CommentCard(
            comment: comment,
          ),
        ),
      );

  _paginationErrorWidget() {
    return DefaultErrorWidget(
      message: context.localizations.paginationBuilderError,
      onRefresh: () => _pagingController.refresh(),
    );
  }
}
