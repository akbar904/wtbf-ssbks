
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counterapp/models/counter_state.dart';

void main() {
	group('CounterState', () {
		test('should create a CounterState with the given counter value', () {
			final counterState = CounterState(counter: 0);
			expect(counterState.counter, 0);
		});

		test('should update the counter value correctly', () {
			final counterState = CounterState(counter: 2);
			expect(counterState.counter, 2);
		});

		test('should serialize to a map correctly', () {
			final counterState = CounterState(counter: 5);
			expect(counterState.toMap(), {'counter': 5});
		});

		test('should deserialize from a map correctly', () {
			final map = {'counter': 10};
			final counterState = CounterState.fromMap(map);
			expect(counterState.counter, 10);
		});
	});
}
