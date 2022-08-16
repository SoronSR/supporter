// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_teams_cubit.dart';

class MyTeamsState extends Equatable {
  const MyTeamsState({required this.teams});

  final List<Team> teams;

  @override
  List<Object?> get props => [teams];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'teams': teams.map((x) => x.toMap()).toList(),
    };
  }

  factory MyTeamsState.fromMap(Map<String, dynamic> map) {
    return MyTeamsState(
      teams: map['teams'] != null
          ? List<Team>.from(
              (map['teams'] as List<dynamic>).map<Team?>(
                (x) => Team.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory MyTeamsState.fromJson(String source) =>
      MyTeamsState.fromMap(json.decode(source) as Map<String, dynamic>);
}
