//import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'job.freezed.dart';
part 'job.g.dart';

typedef JobID = String;

@freezed
class Job with _$Job {
  const factory Job({
    required JobID id, 
    required String name, 
    required int ratePerHour})
    = _Job;

  factory Job.fromJson(Map<String, dynamic> json) =>
    _$JobFromJson(json);

/*   final JobID id;
  final String name;
  final int ratePerHour; */
/* 
  @override
  List<Object> get props => [name, ratePerHour];

  @override
  bool get stringify => true;

  factory Job.fromMap(Map<String, dynamic> data, String id) {
    final name = data['name'] as String;
    final ratePerHour = data['ratePerHour'] as int;
    return Job(
      id: id,
      name: name,
      ratePerHour: ratePerHour,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ratePerHour': ratePerHour,
    };
  } */
}
