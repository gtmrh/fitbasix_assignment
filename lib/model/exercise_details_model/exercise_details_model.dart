import 'dart:convert';

class ExerciseDetailsModel {
  String? bodyPart;
  String? equipment;
  String? gifUrl;
  String? id;
  String? name;
  String? target;

  ExerciseDetailsModel({
    this.bodyPart,
    this.equipment,
    this.gifUrl,
    this.id,
    this.name,
    this.target,
  });

  factory ExerciseDetailsModel.fromMap(Map<String, dynamic> data) {
    return ExerciseDetailsModel(
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
  /// Parses the string and returns the resulting Json object as [ExerciseDetailsModel].
  factory ExerciseDetailsModel.fromJson(String data) {
    return ExerciseDetailsModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ExerciseDetailsModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
