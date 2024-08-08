// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextMatch _$NextMatchFromJson(Map<String, dynamic> json) => NextMatch(
      matchDay: MyDateUtils.dateTimeFromString(json['matchDay'] as String),
      participants: (json['participants'] as num).toInt(),
      spot: json['spot'] as String,
    );

Map<String, dynamic> _$NextMatchToJson(NextMatch instance) => <String, dynamic>{
      'matchDay': MyDateUtils.dateTimeToString(instance.matchDay),
      'participants': instance.participants,
      'spot': instance.spot,
    };

ScheduleOfMonth _$ScheduleOfMonthFromJson(Map<String, dynamic> json) =>
    ScheduleOfMonth(
      matchDay: MyDateUtils.dateTimeFromString(json['matchDay'] as String),
      spot: json['spot'] as String,
    );

Map<String, dynamic> _$ScheduleOfMonthToJson(ScheduleOfMonth instance) =>
    <String, dynamic>{
      'matchDay': MyDateUtils.dateTimeToString(instance.matchDay),
      'spot': instance.spot,
    };
