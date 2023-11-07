//import 'package:equatable/equatable.dart';
import 'package:starter_architecture_flutter_firebase/src/features/jobs/domain/job_model.dart';



import 'package:freezed_annotation/freezed_annotation.dart';
part 'entry_model.freezed.dart';
part 'entry_model.g.dart';

typedef EntryID = String;




@freezed
class EntryModel with _$EntryModel {
  const factory EntryModel({
     required EntryID id,
     required JobID jobId,
     required DateTime start,
     required DateTime end,
     required String comment}) 
    = _EntryModel;

 /*  const Entry._();
  double get durationInHours =>
      end.difference(start).inMinutes.toDouble() / 60.0; */
  factory EntryModel.fromJson(Map<String, dynamic> json) =>
    _EntryModelFromJson(json);
/* 
  final EntryID id;
  final JobID jobId;
  final DateTime start;
  final DateTime end;
  final String comment; 

  @override
  List<Object> get props => [id, jobId, start, end, comment];

  @override
  bool get stringify => true;

  double get durationInHours =>
      end.difference(start).inMinutes.toDouble() / 60.0;

  factory Entry.fromMap(Map<dynamic, dynamic> value, EntryID id) {
    final startMilliseconds = value['start'] as int;
    final endMilliseconds = value['end'] as int;
    return Entry(
      id: id,
      jobId: value['jobId'] as String,
      start: DateTime.fromMillisecondsSinceEpoch(startMilliseconds),
      end: DateTime.fromMillisecondsSinceEpoch(endMilliseconds),
      comment: value['comment'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobId': jobId,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'comment': comment,
    };
  } */
}
