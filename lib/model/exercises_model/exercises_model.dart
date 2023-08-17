import 'dart:convert';

// class ExerciseListModel{
//   List<ExercisesModel>? data;

// ExerciseListModel({ this.data});

//   factory ExerciseListModel.fromMap(Map<String, dynamic> data) => ExerciseListModel(
        
//         data: (data['data'] as List<dynamic>?)
//             ?.map((e) => AllTestData.fromMap(e as Map<String, dynamic>))
//             .toList(),
//       );

//   Map<String, dynamic> toMap() => {
//         'status': status,
//         'data': data?.map((e) => e.toMap()).toList(),
//       };

//   /// `dart:convert`
//   ///
//   /// Parses the string and returns the resulting Json object as [AllTestModel].
//   factory AllTestModel.fromJson(String data) {
//     return AllTestModel.fromMap(json.decode(data) as Map<String, dynamic>);
//   }

//   /// `dart:convert`
//   ///
//   /// Converts [AllTestModel] to a JSON string.
//   String toJson() => json.encode(toMap());



// }


class ExercisesModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;

  ExercisesModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
  });

  factory ExercisesModel.fromMap(Map<String, dynamic> data) {
    return ExercisesModel(
      bodyPart: data['bodyPart'] as String?,
      equipment: data['equipment'] as String?,
      gifUrl: data['gifUrl'] as String?,
      id: data['id'] as String?,
      name: data['name'] as String?,
      target: data['target'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'bodyPart': bodyPart,
        'equipment': equipment,
        'gifUrl': gifUrl,
        'id': id,
        'name': name,
        'target': target,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExercisesModel].
  factory ExercisesModel.fromJson(String data) {
    return ExercisesModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExercisesModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
