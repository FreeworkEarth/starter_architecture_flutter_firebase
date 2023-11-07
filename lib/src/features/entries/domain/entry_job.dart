import 'package:equatable/equatable.dart';
import 'package:starter_architecture_flutter_firebase/src/features/entries/domain/entry_model.dart';
import 'package:starter_architecture_flutter_firebase/src/features/jobs/domain/job_model.dart';

class EntryJob extends Equatable {
  const EntryJob(this.entry, this.job);

  final Entry entry;
  final Job job;

  @override
  List<Object?> get props => [entry, job];

  @override
  bool? get stringify => true;
}
