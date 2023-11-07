import 'package:freezed_annotation/freezed_annotation.dart';
import '../../jobs/domain/job_model.dart';

part 'entry_model.freezed.dart';
part 'entry_model.g.dart';

typedef EntryID = String;

@freezed
class EntryModel with _$EntryModel {
  const factory EntryModel({
    required EntryID id,
    required JobID jobID,
    required DateTime start,
    required DateTime end,
    required String comment,
  }) = _EntryModel;
  const EntryModel._();
  double get durationInHours =>
      end.difference(start).inMinutes.toDouble() / 60.0;
  factory EntryModel.fromJson(Map<String, dynamic> json) =>
      _$EntryModelFromJson(json);
}
