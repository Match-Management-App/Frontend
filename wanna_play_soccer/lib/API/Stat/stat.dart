import 'package:json_annotation/json_annotation.dart';
import 'package:wanna_play_soccer/API/date_utils.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat {
  final int goals;
  final int assist;
  final int defense;
  @JsonKey(
      name: 'matchDate',
      fromJson: MyDateUtils.dateTimeFromString,
      toJson: MyDateUtils.dateTimeToString)
  final DateTime matchDate;

  Stat({
    required this.goals,
    required this.assist,
    required this.defense,
    required this.matchDate,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@JsonSerializable()
class RecentRecord {
  @JsonKey(
      name: 'date',
      fromJson: MyDateUtils.dateTimeFromString,
      toJson: MyDateUtils.dateTimeToString)
  final DateTime date;
  final int goals;
  final int assist;
  final int defense;

  RecentRecord({
    required this.date,
    required this.goals,
    required this.assist,
    required this.defense,
  });

  factory RecentRecord.fromJson(Map<String, dynamic> json) =>
      _$RecentRecordFromJson(json);
  Map<String, dynamic> toJson() => _$RecentRecordToJson(this);

  static DateTime _dateTimeFromString(String date) => DateTime.parse(date);
  static String _dateTimeToString(DateTime date) => date.toIso8601String();
}
