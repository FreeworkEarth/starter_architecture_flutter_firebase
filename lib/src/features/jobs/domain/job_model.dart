import 'package:freezed_annotation/freezed_annotation.dart';
part 'job_model.freezed.dart';
part 'job_model.g.dart';

typedef JobID = String;

@freezed
class JobModel with _$JobModel {
  const factory JobModel({
    required JobID id,
    required String name,
    required int ratePerHour,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);



  factory JobModel.fromMap(Map<String, dynamic> data, String id) {
    final name = data['name'] as String;
    final ratePerHour = data['ratePerHour'] as int;
    return JobModel(
      id: id,
      name: name,
      ratePerHour: ratePerHour,
    );
  }


  factory JobModel.toMap(Map<String, dynamic> data, String id) {
    final name = data['name'] as String;
    final ratePerHour = data['ratePerHour'] as int;
    return JobModel(
      id: id,
      name: name,
      ratePerHour: ratePerHour,
    );
  }



 /*  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
    };
  }  */


}
