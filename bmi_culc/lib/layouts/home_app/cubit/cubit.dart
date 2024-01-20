import 'package:bloc/bloc.dart';
import 'package:bmi_culc/layouts/home_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context);
  int counter = 40;

  void mun() {
    counter--;
    emit(CounterMunState());
  }

  void plus() {
    counter++;
    emit(CounterPlusState());
  }
}
