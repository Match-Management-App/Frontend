import 'package:json_annotation/json_annotation.dart';

part 'hall_of_fame.g.dart';

@JsonSerializable()
class HallOfFame {
  final String userName;
  final int stats;

  HallOfFame({
    required this.userName,
    required this.stats,
  });

  factory HallOfFame.fromJson(Map<String, dynamic> json) =>
      _$HallOfFameFromJson(json);
  Map<String, dynamic> toJson() => _$HallOfFameToJson(this);
}

@JsonSerializable()
class HOFGoals extends HallOfFame {
  HOFGoals({
    required super.userName,
    required super.stats,
  });
}

@JsonSerializable()
class HOFAssists extends HallOfFame {
  HOFAssists({
    required super.userName,
    required super.stats,
  });
}

@JsonSerializable()
class HOFDefences extends HallOfFame {
  HOFDefences({
    required super.userName,
    required super.stats,
  });
}

@JsonSerializable()
class HOFAttendance extends HallOfFame {
  HOFAttendance({
    required super.userName,
    required super.stats,
  });
}
