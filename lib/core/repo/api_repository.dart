//
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fitbasix_exercise/core/api/api.dart';
import 'package:fitbasix_exercise/model/exercise_details_model/exercise_details_model.dart';
import 'package:fitbasix_exercise/model/exercises_model/exercises_model.dart';

import '../api/api_utils.dart';

const title = "ApiRepo";

class ApiRepo {
  Future<List<ExercisesModel>?> getExercises() async {
    List<ExercisesModel> exerciseListModel = [];

    String url = Api.baseUrl + Api.exerciseList;

    try {
      var headers = {Api.key: Api.apiKey};
      final response =
          await apiUtils.get(url: url, options: Options(headers: headers, ));

      print(">>response$response");

      if (response.data is List) {
        List<dynamic> jsonDataList = response.data as List<dynamic>;
        exerciseListModel = jsonDataList.map((jsonData) {
          return ExercisesModel(
            bodyPart: jsonData['bodyPart'],
            equipment: jsonData['equipment'],
            gifUrl: jsonData['gifUrl'],
            id: jsonData['id'],
            name: jsonData['name'],
            target: jsonData['target'],
          );
        }).toList();
      }

      return exerciseListModel;
    } catch (e) {
      print(e);
    }
    return exerciseListModel;
  }

  Future<ExerciseDetailsModel?> getExerciseById(String id) async {
    ExerciseDetailsModel? exerciseDetailsModel;

    String url = Api.baseUrl + Api.exerciseDetails + id;

    try {
      var headers = {Api.key: Api.apiKey};
      final response =
          await apiUtils.get(url: url, options: Options(headers: headers));

      print(">>response$response");

      if (response.data is Map<String, dynamic>) {
        exerciseDetailsModel = ExerciseDetailsModel.fromMap(response.data);
        return exerciseDetailsModel;
      }
    } catch (e) {
      print(e);
    }
    return exerciseDetailsModel;
  }
}
