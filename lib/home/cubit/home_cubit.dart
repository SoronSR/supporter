import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(selectedIndex: 0));

  void setSelectedIndex(int selectedIndex) {
    emit(
      HomeState(selectedIndex: selectedIndex),
    );
  }
}
