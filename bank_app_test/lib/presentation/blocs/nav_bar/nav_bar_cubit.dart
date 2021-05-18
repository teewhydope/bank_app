import 'package:bloc/bloc.dart';

class NavBarCubit extends Cubit<int> {
  NavBarCubit() : super(0);

  void getDashBoard() => emit(0);
  void getMore() => emit(1);
  void getSettings() => emit(2);
}
