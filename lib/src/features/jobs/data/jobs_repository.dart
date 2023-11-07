import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_architecture_flutter_firebase/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:starter_architecture_flutter_firebase/src/features/authentication/domain/app_user.dart';
import 'package:starter_architecture_flutter_firebase/src/features/entries/data/entries_repository.dart';
import 'package:starter_architecture_flutter_firebase/src/features/entries/domain/entry_model.dart';
import 'package:starter_architecture_flutter_firebase/src/features/jobs/domain/job_model.dart';

part 'jobs_repository.g.dart';

class JobsRepository {
  const JobsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String jobPath(String uid, String jobId) => 'users/$uid/jobs/$jobId';
  static String jobsPath(String uid) => 'users/$uid/jobs';
  static String entriesPath(String uid) => EntriesRepository.entriesPath(uid);

  // create
  Future<void> addJob(
          {required UserID uid,
          required String name,
          required int ratePerHour}) =>
      _firestore.collection(jobsPath(uid)).add({
        'name': name,
        'ratePerHour': ratePerHour,
      });

  // update
  Future<void> updateJob({required UserID uid, required JobModel job}) =>
      _firestore.doc(jobPath(uid, job.id)).update(job as Map<Object, Object?>);

  // delete
  Future<void> deleteJob({required UserID uid, required JobID jobId}) async {
    // delete where entry.jobId == job.jobId
    final entriesRef = _firestore.collection(entriesPath(uid));
    final entries = await entriesRef.get();
    for (final snapshot in entries.docs) {
      final entry = EntryModel.fromMap(snapshot.data(), snapshot.id);
      if (entry.jobID == jobId) {
        await snapshot.reference.delete();
      }
    }
    // delete job
    final jobRef = _firestore.doc(jobPath(uid, jobId));
    await jobRef.delete();
  }

  // read
  Stream<JobModel> watchJob({required UserID uid, required JobID jobId}) =>
      _firestore
          .doc(jobPath(uid, jobId))
          .withConverter<JobModel>(
            fromFirestore: (snapshot, _) =>
                JobModel.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (job, _) => job.toJson(),
          )
          .snapshots()
          .map((snapshot) => snapshot.data()!);

  Stream<List<JobModel>> watchJobs({required UserID uid}) => queryJobs(uid: uid)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Query<JobModel> queryJobs({required UserID uid}) =>
      _firestore.collection(jobsPath(uid)).withConverter(
            fromFirestore: (snapshot, _) =>
                JobModel.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (job, _) => job.toJson(),
          );

  Future<List<JobModel>> fetchJobs({required UserID uid}) async {
    final jobs = await queryJobs(uid: uid).get();
    return jobs.docs.map((doc) => doc.data()).toList();
  }
}

@Riverpod(keepAlive: true)
JobsRepository jobsRepository(JobsRepositoryRef ref) {
  return JobsRepository(FirebaseFirestore.instance);
}

@riverpod
Query<JobModel> jobsQuery(JobsQueryRef ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null');
  }
  final repository = ref.watch(jobsRepositoryProvider);
  return repository.queryJobs(uid: user.uid);
}

@riverpod
Stream<JobModel> jobStream(JobStreamRef ref, JobID jobId) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null');
  }
  final repository = ref.watch(jobsRepositoryProvider);
  return repository.watchJob(uid: user.uid, jobId: jobId);
}
