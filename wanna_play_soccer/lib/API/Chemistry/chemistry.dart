import 'package:json_annotation/json_annotation.dart';

part 'chemistry.g.dart';

@JsonSerializable()
class TopThree {
  final String first;
  final String second;
  final String third;

  TopThree({
    required this.first,
    required this.second,
    required this.third,
  });

  factory TopThree.fromJson(Map<String, dynamic> json) =>
      _$TopThreeFromJson(json);
  Map<String, dynamic> toJson() => _$TopThreeToJson(this);
}

/// * 자신이 가장 적은 어시스턴트를 한 유저 세 명
@JsonSerializable()
class LeastAssisted extends TopThree {
  LeastAssisted({
    required super.first,
    required super.second,
    required super.third,
  });
}

/// * 자신이 가장 많은 어시스턴트를 한 유저 세 명
@JsonSerializable()
class MostAssisted extends TopThree {
  MostAssisted({
    required super.first,
    required super.second,
    required super.third,
  });
}

/// * 자신의 골에 가장 적은 어시스턴트를 한 유저 세 명
@JsonSerializable()
class LeastAssistsToMyGoals extends TopThree {
  LeastAssistsToMyGoals({
    required super.first,
    required super.second,
    required super.third,
  });
}

/// * 자신의 골에 가장 많은 어시스턴트를 한 유저 세 명
@JsonSerializable()
class MostAssistsToMyGoals extends TopThree {
  MostAssistsToMyGoals({
    required super.first,
    required super.second,
    required super.third,
  });
}
