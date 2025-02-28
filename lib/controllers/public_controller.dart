import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sipera_app/models/public/achievement_model.dart' as am;
import 'package:sipera_app/models/public/article_model.dart' as arm;
import 'package:sipera_app/models/public/event_model.dart' as em;
import 'package:sipera_app/models/public/slider_model.dart' as slm;
import 'package:sipera_app/models/public/statistic_model.dart' as sm;
import 'package:sipera_app/services/public/public_service.dart';

class PublicController extends GetxController {
  RxBool isDone = false.obs;
  RxBool articleStatus = false.obs;
  RxBool sliderStatus = false.obs;
  RxBool articleFetchStatus = false.obs;
  RxBool eventStatus = false.obs;
  RxBool achievementStatus = false.obs;
  RxBool eventFetchStatus = false.obs;
  RxBool statisticStatus = false.obs;
  RxBool achievementFetchStatus = false.obs;
  RxList<arm.Data>? listArticle = <arm.Data>[].obs;
  Rx<arm.ArticleModel>? articleResult = arm.ArticleModel().obs;
  Rx<sm.StatisticModel>? statisticResult = sm.StatisticModel().obs;
  Rx<slm.SliderModel>? sliderResult = slm.SliderModel().obs;
  var indexSlider = 0.obs;
  Rx<em.EventModel>? eventResult = em.EventModel().obs;

  Rx<am.AchievementModel>? achievementResult = am.AchievementModel().obs;
  RxList<em.Data>? listEvent = <em.Data>[].obs;
  RxList<am.Data>? listAchievement = <am.Data>[].obs;

  RxList<slm.Slider>? listSlider = <slm.Slider>[].obs;
  RxInt currentPage = 0.obs;
  RxInt lastPage = 0.obs;
  fetchAllData() async {
    try {
      isDone = false.obs;
      await getStatisticSports();
      await getSliderData();
      await getArticleData('', '1');
      if (kDebugMode) {
        print('berhasil 1');
      }
      await getEventData('', '1');
      if (kDebugMode) {
        print('berhasil 2');
      }
      await getAchievementData('', '1');
      if (kDebugMode) {
        print('berhasil finish');
      }

      if (kDebugMode) {
        print('done slider');
      }
      isDone = true.obs;
    } catch (e) {
      isDone = false.obs;
    }
  }

  Future getStatisticSports() async {
    try {
      statisticStatus.value = false;
      sm.StatisticModel? statisticModel =
          await PublicService().getStatisticData();

      if (statisticModel == null) {
        return;
      } else {
        statisticResult?.value = statisticModel;
        statisticStatus.value = true;
      }
    } catch (e) {
      statisticStatus.value = false;
    }
  }

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
      articleStatus.value = false;
    }
  }

  Future getSliderData() async {
    try {
      sliderStatus.value = false;
      slm.SliderModel? sliderModel = await PublicService().getSliderData();

      if (sliderModel == null) {
        return;
      } else {
        sliderResult?.value = sliderModel;
        listSlider?.value = sliderModel.results!.slider!;

        sliderStatus.value = true;
      }
    } catch (e) {
      sliderStatus.value = false;
    }
  }

  Future getEventData(String? search, String? page) async {
    try {
      eventStatus.value = false;
      em.EventModel? eventModel =
          await PublicService().getEventData(search, page);

      if (eventModel == null) {
        return;
      } else {
        eventResult?.value = eventModel;
        listEvent?.value = eventModel.results!.event!.data!;

        eventStatus.value = true;
      }
    } catch (e) {
      eventStatus.value = false;
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

          listArticle = listArticle! + articleModel.results!.allArtikel!.data!;

          articleFetchStatus.value = true;
        }
      }
    } catch (e) {
      articleFetchStatus.value = false;
    }
  }

  Future refetchEvent(String? search, String? page) async {
    try {
      eventFetchStatus.value = false;
      em.EventModel? eventModel =
          await PublicService().getEventData(search, page);
      await Future.delayed(const Duration(seconds: 1));

      if (eventModel != null) {
        if (eventModel.results!.event!.data!.isEmpty) {
          return;
        } else {
          eventResult?.value = eventModel;
          currentPage.value = eventModel.results!.event!.currentPage!;
          lastPage.value = eventModel.results!.event!.lastPage!;

          listEvent = listEvent! + eventModel.results!.event!.data!;

          eventFetchStatus.value = true;
        }
      }
    } catch (e) {
      eventFetchStatus.value = false;
    }
  }

  Future refetchAchievement(String? search, String? page) async {
    try {
      achievementFetchStatus.value = false;
      am.AchievementModel? achievementModel =
          await PublicService().getAchievementData(search, page);
      await Future.delayed(const Duration(seconds: 1));

      if (achievementModel != null) {
        if (achievementModel.results!.prestasi!.data!.isEmpty) {
          return;
        } else {
          achievementResult?.value = achievementModel;
          currentPage.value = achievementModel.results!.prestasi!.currentPage!;
          lastPage.value = achievementModel.results!.prestasi!.lastPage!;

          listAchievement =
              listAchievement! + achievementModel.results!.prestasi!.data!;

          achievementFetchStatus.value = true;
        }
      }
    } catch (e) {
      achievementFetchStatus.value = false;
    }
  }

  Future getAchievementData(String? search, String? page) async {
    try {
      achievementStatus.value = false;
      am.AchievementModel? achievementModel =
          await PublicService().getAchievementData(search, page);

      if (achievementModel == null) {
        return;
      } else {
        achievementResult?.value = achievementModel;
        listAchievement?.value = achievementModel.results!.prestasi!.data!;

        achievementStatus.value = true;
      }
    } catch (e) {
      achievementStatus.value = false;
    }
  }
}
