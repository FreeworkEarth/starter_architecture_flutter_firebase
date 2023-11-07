//import 'package:equatable/equatable.dart';
import 'package:starter_architecture_flutter_firebase/src/features/entries/domain/entry_freeze..dart';
import 'package:starter_architecture_flutter_firebase/src/features/jobs/domain/job.dart';


import 'package:freezed_annotation/freezed_annotation.dart';
part 'entry_job.freezed.dart';
part 'entry_job.g.dart';
@freezed
class EntryJob with _$EntryJob{
  const EntryJob(
    Entry entry, 
    Job job)
    = _EntryJob;

  factory EntryJob.fromJson(Map<String, dynamic> json) =>
    _$EntryJobFromJson(json);
/*   final Entry entry;
  final Job job;

  @override
  List<Object?> get props => [entry, job];

  @override
  bool? get stringify => true; */
}
