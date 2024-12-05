
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/models/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
	CounterCubit() : super(CounterState(counter: 0));

	void increment() {
		emit(CounterState(counter: state.counter == 0 ? 10 : state.counter * 10));
	}
}
