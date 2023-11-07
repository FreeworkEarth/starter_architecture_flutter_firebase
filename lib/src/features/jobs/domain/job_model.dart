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

}
