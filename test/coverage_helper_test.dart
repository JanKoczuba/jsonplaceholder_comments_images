import 'package:jsonplaceholder_comments_images/app/constants.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/utils/context_extension.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/utils/safe_print.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/infrastructure/comments/repository/api_comments_repository.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/infrastructure/comments/model/get_comments_response.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/infrastructure/comments/api/comments_api.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/infrastructure/core/services/base_api_service.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/repository/api_image_gallery_repository.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/model/get_image_response.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/infrastructure/image_gallery/api/image_gallery_api.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/domain/comments/repository/comments_repository.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/domain/comments/entity/comment.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/domain/comments/use_case/get_comments_use_case.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/domain/core/failure.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/domain/image_gallery/repository/image_gallery_repository.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/domain/image_gallery/entity/gallery_image.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/domain/image_gallery/use_case/get_gallery_images_use_case.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/comments/widget/comment_card.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/comments/widget/comments.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/comments/comments_page.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/widget/no_internet_connection_page.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/widget/bottom_nav_icon_builder.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/home_page.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/image_gallery/image_gallery_page.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/image_gallery/widget/image_gallery.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/home/image_gallery/widget/image_item.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/core/default_error_widget.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/config/bloc/config_cubit.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/resource/app_text_style.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/resource/app_color.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/presentation/resource/app_padding.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/router/app_router.gr.dart'; // ignore: unused_import
import 'package:jsonplaceholder_comments_images/router/app_router.dart'; // ignore: unused_import
void main(){}
