part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  List<Object?> get props => [selectedIndex];
}
