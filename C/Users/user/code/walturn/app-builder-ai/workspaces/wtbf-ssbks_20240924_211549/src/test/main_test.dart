
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counterapp/main.dart';

class MockCounterCubit extends Mock implements CounterCubit {}

void main() {
	group('Main App', () {
		testWidgets('should render MyApp widget', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(MyApp), findsOneWidget);
		});

		testWidgets('should setup and initialize the HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('CounterCubit', () {
		blocTest<CounterCubit, CounterState>(
			'should emit CounterState(counter: 0) when initialized',
			build: () => CounterCubit(),
			expect: () => [],
		);

		blocTest<CounterCubit, CounterState>(
			'should emit CounterState(counter: 10) when increment is called',
			build: () => CounterCubit(),
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(counter: 10)],
		);
	});

	group('CounterState', () {
		test('should create CounterState with initial counter value', () {
			final state = CounterState(counter: 0);
			expect(state.counter, 0);
		});
	});
}
