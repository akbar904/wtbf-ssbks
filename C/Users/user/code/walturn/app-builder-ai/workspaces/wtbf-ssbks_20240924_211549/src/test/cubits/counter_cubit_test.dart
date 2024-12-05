
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counterapp/cubits/counter_cubit.dart';
import 'package:counterapp/models/counter_state.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is CounterState(counter: 0)', () {
			expect(counterCubit.state, CounterState(counter: 0));
		});

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(counter: 10)] when increment is called once',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(counter: 10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(counter: 10), CounterState(counter: 100)] when increment is called twice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [CounterState(counter: 10), CounterState(counter: 100)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(counter: 10), CounterState(counter: 100), CounterState(counter: 1000)] when increment is called thrice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
				cubit.increment();
			},
			expect: () => [CounterState(counter: 10), CounterState(counter: 100), CounterState(counter: 1000)],
		);
	});
}
