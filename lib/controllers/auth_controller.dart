import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:sipera_app/models/admin/login_model.dart' as login;
import 'package:sipera_app/models/admin/profile_model.dart' as promin;
import 'package:sipera_app/services/admin/auth_service.dart';
import 'package:sipera_app/models/admin/graphic_achievement.dart' as grasi;
import 'package:sipera_app/models/admin/graphic_atlet.dart' as gralet;
import 'package:sipera_app/models/admin/graphic_sportsman.dart' as gratal;
import 'package:sipera_app/models/admin/achievement_admin.dart' as achmin;
import 'package:sipera_app/models/admin/atlet_admin.dart' as atmin;
import 'package:sipera_app/models/admin/coach_admin.dart' as comin;
import 'package:sipera_app/models/admin/facility_admin.dart' as famin;
import 'package:sipera_app/models/admin/referee_admin.dart' as refmin;
import 'package:sipera_app/models/admin/teacher_admin.dart' as temin;
import 'package:sipera_app/services/admin/category_service.dart';

import '../services/admin/graphic_service.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;
  RxBool isObscure = true.obs;
  Rx<login.LoginModel>? userLogin = login.LoginModel().obs;

  Rx<gratal.GraphicSportsman>? graphicTotal = gratal.GraphicSportsman().obs;

  Rx<gralet.GraphicAtlet>? graphicAtlet = gralet.GraphicAtlet().obs;

  Rx<grasi.GraphicAchievement>? graphicAchievement =
      grasi.GraphicAchievement().obs;

  Rx<atmin.AtletAdmin>? atletAdmin = atmin.AtletAdmin().obs;
  RxList<atmin.TotalAtletPerCabor>? listCabor =
      <atmin.TotalAtletPerCabor>[].obs;

  Rx<comin.CoachAdmin>? coachAdmin = comin.CoachAdmin().obs;
  RxList<comin.TotalPelatihPerCabor>? listCoach =
      <comin.TotalPelatihPerCabor>[].obs;

  Rx<refmin.RefereeAdmin>? refereeAdmin = refmin.RefereeAdmin().obs;
  RxList<refmin.TotalWasitPerCabor>? listReferee =
      <refmin.TotalWasitPerCabor>[].obs;

  Rx<temin.TeacherAdmin>? teacherAdmin = temin.TeacherAdmin().obs;
  RxList<temin.TotalGuruOlahragaPerCabor>? listTeacher =
      <temin.TotalGuruOlahragaPerCabor>[].obs;

  Rx<famin.FacilityAdmin>? facilityAdmin = famin.FacilityAdmin().obs;
  RxList<famin.SaranaPrasarana>? listFacility = <famin.SaranaPrasarana>[].obs;

  Rx<achmin.AchievementAdmin>? achievementAdmin = achmin.AchievementAdmin().obs;

  RxList<gralet.PerTahun>? listGraphAtlet = <gralet.PerTahun>[].obs;
  RxList<grasi.PerTahun>? listGraphAchievement = <grasi.PerTahun>[].obs;

  Rx<promin.ProfileModel>? profileAdmin = promin.ProfileModel().obs;
  RxDouble jumlah = 0.0.obs;
  RxDouble jumlahUmur = 0.0.obs;

  RxString errorMessage = ''.obs;

  RxInt jumlahJanAtlet = 0.obs;
  RxInt jumlahFebAtlet = 0.obs;
  RxInt jumlahMarAtlet = 0.obs;
  RxInt jumlahAprAtlet = 0.obs;
  RxInt jumlahMayAtlet = 0.obs;
  RxInt jumlahJunAtlet = 0.obs;
  RxInt jumlahJulAtlet = 0.obs;
  RxInt jumlahAugAtlet = 0.obs;
  RxInt jumlahSepAtlet = 0.obs;
  RxInt jumlahOctAtlet = 0.obs;
  RxInt jumlahNovAtlet = 0.obs;
  RxInt jumlahDesAtlet = 0.obs;

  RxInt jumlahJanPrestasi = 0.obs;
  RxInt jumlahFebPrestasi = 0.obs;
  RxInt jumlahMarPrestasi = 0.obs;
  RxInt jumlahAprPrestasi = 0.obs;
  RxInt jumlahMayPrestasi = 0.obs;
  RxInt jumlahJunPrestasi = 0.obs;
  RxInt jumlahJulPrestasi = 0.obs;
  RxInt jumlahAugPrestasi = 0.obs;
  RxInt jumlahSepPrestasi = 0.obs;
  RxInt jumlahOctPrestasi = 0.obs;
  RxInt jumlahNovPrestasi = 0.obs;
  RxInt jumlahDesPrestasi = 0.obs;

  bool obscureStatus() {
    return isObscure.value = !isObscure.value;
  }

  loginController(String email, String pass) async {
    try {
      if (email == "" || pass == "") {
        errorMessage(
            'Terjadi kesalahan, silakan periksa kembali email dan password anda');
        return;
      }
      login.LoginModel? loginModel =
          await AuthService().loginProfile(email: email, password: pass);

      if (loginModel == null) {
        isLogin.value = false;
      } else {
        userLogin?.value = loginModel;

        if (kDebugMode) {
          print('xx');
        }
        if (kDebugMode) {
          print(userLogin!.value.results!.name);
        }
        await getProfileAdmin();
        await getGraphicTotal();
        await getGraphicAchievement();
        await getGraphicAtlet();
        await getAtletAdmin();
        await getCoachAdmin();
        await getAchievementAdmin();
        await getFacilityAdmin();
        await getTeacherAdmin();
        await getRefereeAdmin();
        isLogin.value = true;
      }
    } catch (e) {
      isLogin.value = false;
    }
  }

  Future<bool> fetchSave() async {
    try {
      isLogin.value = false;
      await getProfileAdmin();
      await getGraphicTotal();
      await getGraphicAchievement();
      await getGraphicAtlet();
      await getAtletAdmin();
      await getCoachAdmin();
      await getAchievementAdmin();
      await getFacilityAdmin();
      await getTeacherAdmin();
      await getRefereeAdmin();
      isLogin.value = true;
      return isLogin.value;
    } catch (e) {
      isLogin.value = false;
      return isLogin.value;
    }
  }

  Future<bool>? logoutController() {
    isLogin.value = false;
    return AuthService().logout();
  }

  Future getGraphicTotal() async {
    try {
      gratal.GraphicSportsman? graphicTotalModel =
          await GraphicService().getGraphicSportsman();

      if (graphicTotalModel == null) {
        // graphicTotalSuccess.value = false;
        return;
      } else {
        graphicTotal?.value = graphicTotalModel;

        jumlah.value = (graphicTotalModel.results!.atlet! +
                graphicTotalModel.results!.pelatih! +
                graphicTotalModel.results!.wasit! +
                graphicTotalModel.results!.guru!)
            .toDouble();

        if (kDebugMode) {
          print(jumlah);
        }
        // graphicTotalSuccess.value = true;
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getGraphicAtlet() async {
    try {
      if (kDebugMode) {
        print('lllll');
      }
      gralet.GraphicAtlet? graphicAtletModel =
          await GraphicService().getGraphicAtlet();

      if (graphicAtletModel == null) {
        return;
      } else {
        graphicAtlet?.value = graphicAtletModel;
        if (graphicAtletModel.results!.jan!.isNotEmpty) {
          RxList<gralet.Jan>? listJanAtlet = <gralet.Jan>[].obs;
          listJanAtlet.value = graphicAtletModel.results!.jan!;
          for (var atlet in listJanAtlet) {
            jumlahJanAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.feb!.isNotEmpty) {
          RxList<gralet.Feb>? listFebAtlet = <gralet.Feb>[].obs;
          listFebAtlet.value = graphicAtletModel.results!.feb!;
          for (var atlet in listFebAtlet) {
            jumlahFebAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.mar!.isNotEmpty) {
          RxList<gralet.Mar>? listMarAtlet = <gralet.Mar>[].obs;
          listMarAtlet.value = graphicAtletModel.results!.mar!;
          for (var atlet in listMarAtlet) {
            jumlahMarAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.apr!.isNotEmpty) {
          RxList<gralet.Apr>? listAprAtlet = <gralet.Apr>[].obs;
          listAprAtlet.value = graphicAtletModel.results!.apr!;
          for (var atlet in listAprAtlet) {
            jumlahAprAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.mei!.isNotEmpty) {
          RxList<gralet.Mei>? listMeiAtlet = <gralet.Mei>[].obs;
          listMeiAtlet.value = graphicAtletModel.results!.mei!;
          for (var atlet in listMeiAtlet) {
            jumlahMayAtlet += int.parse(atlet.total!);
          }
          if (kDebugMode) {
            print(jumlahMayAtlet);
          }
        }
        if (graphicAtletModel.results!.jun!.isNotEmpty) {
          RxList<gralet.Jun>? listJunAtlet = <gralet.Jun>[].obs;
          listJunAtlet.value = graphicAtletModel.results!.jun!;
          for (var atlet in listJunAtlet) {
            jumlahJunAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.jul!.isNotEmpty) {
          RxList<gralet.Jul>? listJulAtlet = <gralet.Jul>[].obs;
          listJulAtlet.value = graphicAtletModel.results!.jul!;
          for (var atlet in listJulAtlet) {
            jumlahJulAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.ags!.isNotEmpty) {
          RxList<gralet.Ags>? listAugAtlet = <gralet.Ags>[].obs;
          listAugAtlet.value = graphicAtletModel.results!.ags!;
          for (var atlet in listAugAtlet) {
            jumlahAugAtlet += int.parse(atlet.total!);
          }
          if (kDebugMode) {
            print(jumlahAugAtlet);
          }
        }
        if (graphicAtletModel.results!.sep!.isNotEmpty) {
          RxList<gralet.Sep>? listSepAtlet = <gralet.Sep>[].obs;
          listSepAtlet.value = graphicAtletModel.results!.sep!;
          for (var atlet in listSepAtlet) {
            jumlahSepAtlet += int.parse(atlet.total!);
          }
          if (kDebugMode) {
            print(jumlahSepAtlet);
          }
        }
        if (graphicAtletModel.results!.okt!.isNotEmpty) {
          RxList<gralet.Okt>? listOctAtlet = <gralet.Okt>[].obs;
          listOctAtlet.value = graphicAtletModel.results!.okt!;
          for (var atlet in listOctAtlet) {
            jumlahOctAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.nov!.isNotEmpty) {
          RxList<gralet.Nov>? listNovAtlet = <gralet.Nov>[].obs;
          listNovAtlet.value = graphicAtletModel.results!.nov!;
          for (var atlet in listNovAtlet) {
            jumlahNovAtlet += int.parse(atlet.total!);
          }
        }
        if (graphicAtletModel.results!.des!.isNotEmpty) {
          RxList<gralet.Des>? listDesAtlet = <gralet.Des>[].obs;
          listDesAtlet.value = graphicAtletModel.results!.des!;
          for (var atlet in listDesAtlet) {
            jumlahDesAtlet += int.parse(atlet.total!);
          }
        }
        jumlahUmur.value = (graphicAtletModel.results!.anak! +
                graphicAtletModel.results!.remaja! +
                graphicAtletModel.results!.dewasa!)
            .toDouble();
        if (graphicAtletModel.results!.perTahun!.isNotEmpty) {
          listGraphAtlet!.value = graphicAtletModel.results!.perTahun!;
        }
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getGraphicAchievement() async {
    try {
      grasi.GraphicAchievement? graphicAchievementModel =
          await GraphicService().getGraphicAchievement();

      if (graphicAchievementModel == null) {
        return;
      } else {
        graphicAchievement?.value = graphicAchievementModel;

        if (graphicAchievementModel.results!.jan!.isNotEmpty) {
          RxList<grasi.Jan>? listJanPrestasi = <grasi.Jan>[].obs;
          listJanPrestasi.value = graphicAchievementModel.results!.jan!;
          for (var prestasi in listJanPrestasi) {
            jumlahJanPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.feb!.isNotEmpty) {
          RxList<grasi.Feb>? listFebPrestasi = <grasi.Feb>[].obs;
          listFebPrestasi.value = graphicAchievementModel.results!.feb!;
          for (var prestasi in listFebPrestasi) {
            jumlahFebPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.mar!.isNotEmpty) {
          RxList<grasi.Mar>? listMarPrestasi = <grasi.Mar>[].obs;
          listMarPrestasi.value = graphicAchievementModel.results!.mar!;
          for (var prestasi in listMarPrestasi) {
            jumlahMarPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.apr!.isNotEmpty) {
          RxList<grasi.Apr>? listAprPrestasi = <grasi.Apr>[].obs;
          listAprPrestasi.value = graphicAchievementModel.results!.apr!;
          for (var prestasi in listAprPrestasi) {
            jumlahAprPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.mei!.isNotEmpty) {
          RxList<grasi.Mei>? listMeiPrestasi = <grasi.Mei>[].obs;
          listMeiPrestasi.value = graphicAchievementModel.results!.mei!;
          for (var prestasi in listMeiPrestasi) {
            jumlahMayPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.jun!.isNotEmpty) {
          RxList<grasi.Jun>? listJunPrestasi = <grasi.Jun>[].obs;
          listJunPrestasi.value = graphicAchievementModel.results!.jun!;
          for (var prestasi in listJunPrestasi) {
            jumlahJunPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.jul!.isNotEmpty) {
          RxList<grasi.Jul>? listJulPrestasi = <grasi.Jul>[].obs;
          listJulPrestasi.value = graphicAchievementModel.results!.jul!;
          for (var prestasi in listJulPrestasi) {
            jumlahJulPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.ags!.isNotEmpty) {
          RxList<grasi.Ags>? listAgsPrestasi = <grasi.Ags>[].obs;
          listAgsPrestasi.value = graphicAchievementModel.results!.ags!;
          for (var prestasi in listAgsPrestasi) {
            jumlahAugPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.sep!.isNotEmpty) {
          RxList<grasi.Sep>? listSepPrestasi = <grasi.Sep>[].obs;
          listSepPrestasi.value = graphicAchievementModel.results!.sep!;
          for (var prestasi in listSepPrestasi) {
            jumlahSepPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.okt!.isNotEmpty) {
          RxList<grasi.Okt>? listOktPrestasi = <grasi.Okt>[].obs;
          listOktPrestasi.value = graphicAchievementModel.results!.okt!;
          for (var prestasi in listOktPrestasi) {
            jumlahOctPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.nov!.isNotEmpty) {
          RxList<grasi.Nov>? listNovPrestasi = <grasi.Nov>[].obs;
          listNovPrestasi.value = graphicAchievementModel.results!.nov!;
          for (var prestasi in listNovPrestasi) {
            jumlahNovPrestasi += int.parse(prestasi.total!);
          }
        }
        if (graphicAchievementModel.results!.des!.isNotEmpty) {
          RxList<grasi.Des>? listDesPrestasi = <grasi.Des>[].obs;
          listDesPrestasi.value = graphicAchievementModel.results!.des!;
          for (var prestasi in listDesPrestasi) {
            jumlahDesPrestasi += int.parse(prestasi.total!);
          }
        }

        if (graphicAchievementModel.results!.perTahun!.isNotEmpty) {
          listGraphAchievement!.value =
              graphicAchievementModel.results!.perTahun!;
        }
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getAtletAdmin() async {
    try {
      atmin.AtletAdmin? atletModel = await CategoryService().getAtletAdmin();

      if (atletModel == null) {
      } else {
        atletAdmin?.value = atletModel;
        if (atletModel.results!.totalAtletPerCabor != null) {
          listCabor?.value = atletModel.results!.totalAtletPerCabor!;
        }

        if (kDebugMode) {
          print(atletAdmin!.value.status);
        }
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getCoachAdmin() async {
    try {
      comin.CoachAdmin? coachModel = await CategoryService().getCoachAdmin();

      if (coachModel == null) {
        return;
      } else {
        coachAdmin?.value = coachModel;
        if (coachModel.results!.totalPelatihPerCabor != null) {
          listCoach?.value = coachModel.results!.totalPelatihPerCabor!;
        }
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getRefereeAdmin() async {
    try {
      refmin.RefereeAdmin? refereeModel =
          await CategoryService().getRefereeAdmin();

      if (refereeModel == null) {
        return;
      } else {
        refereeAdmin?.value = refereeModel;
        if (refereeModel.results!.totalWasitPerCabor != null) {
          listReferee?.value = refereeModel.results!.totalWasitPerCabor!;
        }
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getTeacherAdmin() async {
    try {
      temin.TeacherAdmin? teacherModel =
          await CategoryService().getTeacherAdmin();

      if (teacherModel == null) {
        return;
      } else {
        teacherAdmin?.value = teacherModel;
        if (teacherModel.results!.totalGuruOlahragaPerCabor != null) {
          listTeacher?.value = teacherModel.results!.totalGuruOlahragaPerCabor!;
        }
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getFacilityAdmin() async {
    try {
      famin.FacilityAdmin? facilityModel =
          await CategoryService().getFacilityAdmin();

      if (facilityModel == null) {
        return;
      } else {
        facilityAdmin?.value = facilityModel;
        if (facilityModel.results!.saranaPrasarana != null) {
          listFacility?.value = facilityModel.results!.saranaPrasarana!;
        }
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getAchievementAdmin() async {
    try {
      achmin.AchievementAdmin? achievementModel =
          await CategoryService().getAchievementAdmin();

      if (achievementModel == null) {
        return;
      } else {
        achievementAdmin?.value = achievementModel;
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }

  Future getProfileAdmin() async {
    try {
      promin.ProfileModel? profileModel = await AuthService().getProfile();
      if (profileModel == null) {
        return;
      } else {
        profileAdmin?.value = profileModel;
      }
    } catch (e) {
      errorMessage('Terjadi kesalahan, silakan periksa koneksi internet anda');
      rethrow;
    }
  }
}
