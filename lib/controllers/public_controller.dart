import 'package:get/get.dart';
import 'package:sipera_app/models/public/article_model.dart' as arm;
import 'package:sipera_app/services/public/public_service.dart';

class PublicController extends GetxController {
  RxBool isDone = false.obs;
  RxBool articleStatus = false.obs;
  RxBool articleFetchStatus = false.obs;
  RxList<arm.Data>? listArticle = <arm.Data>[].obs;
  Rx<arm.ArticleModel>? articleResult = arm.ArticleModel().obs;
  RxInt currentPage = 0.obs;
  RxInt lastPage = 0.obs;
  fetchAllData() async {
    try {
      isDone = false.obs;
      await getArticleData('', '1');
      isDone = true.obs;
    } catch (e) {
      rethrow;
    }
  }

  // getStatisticSports() {
  //   try {} catch (e) {
  //     rethrow;
  //   }
  // }

  Future getArticleData(String? search, String? page) async {
    try {
      articleStatus.value = false;
      arm.ArticleModel? articleModel =
          await PublicService().getArticleData(search, page);

      if (articleModel == null) {
        return;
      } else {
        articleResult?.value = articleModel;
        listArticle?.value = articleModel.results!.allArtikel!.data!;

        articleStatus.value = true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future refetchArticle(String? search, String? page) async {
    try {
      articleFetchStatus.value = false;
      arm.ArticleModel? articleModel =
          await PublicService().getArticleData(search, page);
      await Future.delayed(const Duration(seconds: 1));

      if (articleModel != null) {
        if (articleModel.results!.allArtikel!.data!.isEmpty) {
          return;
        } else {
          articleResult?.value = articleModel;
          currentPage.value = articleModel.results!.allArtikel!.currentPage!;
          lastPage.value = articleModel.results!.allArtikel!.lastPage!;

          RxList<arm.Data>? listNewList =
              listArticle! + articleModel.results!.allArtikel!.data!;

          articleFetchStatus.value = true;
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}
