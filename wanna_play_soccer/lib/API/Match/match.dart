import 'package:json_annotation/json_annotation.dart';
import 'package:wanna_play_soccer/API/date_utils.dart';

part 'match.g.dart';

@JsonSerializable()
class NextMatch {
  @JsonKey(
    name: 'matchDay',
    fromJson: MyDateUtils.dateTimeFromString,
    toJson: MyDateUtils.dateTimeToString,
  )
  final DateTime matchDay;
  final int participants; // 참가 인원
  final String spot; // 장소

  NextMatch({
    required this.matchDay,
    required this.participants,
    required this.spot,
  });

  factory NextMatch.fromJson(Map<String, dynamic> json) =>
      _$NextMatchFromJson(json);
  Map<String, dynamic> toJson() => _$NextMatchToJson(this);
}

@JsonSerializable()
class ScheduleOfMonth {
  @JsonKey(
    name: 'matchDay',
    fromJson: MyDateUtils.dateTimeFromString,
    toJson: MyDateUtils.dateTimeToString,
  )
  final DateTime matchDay;
  final String spot;

  ScheduleOfMonth({
    required this.matchDay,
    required this.spot,
  });

  factory ScheduleOfMonth.fromJson(Map<String, dynamic> json) =>
      _$ScheduleOfMonthFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleOfMonthToJson(this);
}
