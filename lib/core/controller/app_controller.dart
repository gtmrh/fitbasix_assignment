import 'dart:async';
import 'dart:io';
import 'package:fitbasix_exercise/model/exercise_details_model/exercise_details_model.dart';
import 'package:fitbasix_exercise/model/exercises_model/exercises_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../api/log_util.dart';
import '../repo/api_repository.dart';

const title = "AppController";

class AppController extends GetxController {
  // late Position position;

  var isLoading = false.obs;

  final _exerciseList = <ExercisesModel>[].obs;
  List<ExercisesModel> get exerciseList => _exerciseList;

  Rx<ExerciseDetailsModel> exerciseDetails = ExerciseDetailsModel().obs;

  @override
  void onInit() {
    Log.logs(title, "onInit:: >>>>>>> ");

    getExercise();
    super.onInit();
  }

  getExercise() async {
    isLoading.value = true;
    try {
      final result = await ApiRepo().getExercises();
      Log.logs(title, "getExercise:: result >>>>> ${result!}");

      if (result.isNotEmpty) {
        _exerciseList.value = result;

        Fluttertoast.showToast(
            msg: "${_exerciseList.value.length} exercises available");

        print(">>getExercise>>>${_exerciseList.value}");
        isLoading.value = false;
      } else {}
    } catch (e) {
      Log.logs(title, "getExercise:: e >>>>> $e");
    }
    update();
  }

  getExerciseDetails(String id) async {
    try {
      final result = await ApiRepo().getExerciseById(id);
      Log.logs(title, "getExerciseDetails:: result >>>>> ${result!}");

      exerciseDetails.value = result;

      Fluttertoast.showToast(
          msg: "${exerciseDetails.value.name} exercise details");

      update();

      print(">>mycourse>>>${exerciseDetails.value}");
    } catch (e) {
      Log.logs(title, "getExerciseDetails:: e >>>>> $e");
      // showSnackbar("Api Error", "error:: $e");
    }
  }
}
