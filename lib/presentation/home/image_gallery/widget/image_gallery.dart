import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../app/constants.dart';
import '../../../../di/di.dart';
import '../../../../domain/image_gallery/entity/gallery_image.dart';
import '../../../../domain/image_gallery/use_case/get_gallery_images_use_case.dart';
import '../../../../utils/context_extension.dart';
import '../../../core/default_error_widget.dart';
import 'image_item.dart';

class ImageGallery extends StatefulWidget {
  const ImageGallery({Key? key}) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final PagingController<int, GalleryImage> _pagingController =
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
    final newPhotos = await getIt<GetGalleryImagesUseCase>().execute(pageKey);
    newPhotos.fold(
      (l) => _pagingController.error = l,
      (photos) {
        final isLastPage = photos.length < Constants.imageGalleryItemLimit;
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
  Widget build(BuildContext context) => PagedGridView<int, GalleryImage>(
        pagingController: _pagingController,
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 4,
        ),
        builderDelegate: PagedChildBuilderDelegate<GalleryImage>(
          firstPageErrorIndicatorBuilder: (context) => _paginationErrorWidget(),
          newPageErrorIndicatorBuilder: (context) => _paginationErrorWidget(),
          itemBuilder: (context, image, index) => InkWell(
            onTap: () => _showAlertDialog(context, image),
            child: ImageItem(
              imageUrl: image.thumbnailUrl,
            ),
          ),
        ),
      );

  _paginationErrorWidget() {
    return DefaultErrorWidget(
      message: context.localizations.paginationBuilderError,
      onRefresh: () => _pagingController.refresh(),
    );
  }

  _showAlertDialog(BuildContext context, GalleryImage image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(image.title),
          content: ImageItem(
            imageUrl: image.url,
            loadingWidget: const SizedBox(
              height: 250,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
