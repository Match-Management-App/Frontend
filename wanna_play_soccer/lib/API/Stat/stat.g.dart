// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      goals: (json['goals'] as num).toInt(),
      assist: (json['assist'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      matchDate: MyDateUtils.dateTimeFromString(json['matchDate'] as String),
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'goals': instance.goals,
      'assist': instance.assist,
      'defense': instance.defense,
      'matchDate': MyDateUtils.dateTimeToString(instance.matchDate),
    };

RecentRecord _$RecentRecordFromJson(Map<String, dynamic> json) => RecentRecord(
      date: MyDateUtils.dateTimeFromString(json['date'] as String),
      goals: (json['goals'] as num).toInt(),
      assist: (json['assist'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
    );

Map<String, dynamic> _$RecentRecordToJson(RecentRecord instance) =>
    <String, dynamic>{
      'date': MyDateUtils.dateTimeToString(instance.date),
      'goals': instance.goals,
      'assist': instance.assist,
      'defense': instance.defense,
    };
