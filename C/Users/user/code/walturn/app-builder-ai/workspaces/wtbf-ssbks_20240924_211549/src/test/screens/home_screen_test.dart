
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/screens/home_screen.dart';

// Mock dependencies directly used in home_screen.dart
class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('displays CounterDisplay and IncrementButton', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.byType(CounterDisplay), findsOneWidget);
			expect(find.byType(IncrementButton), findsOneWidget);
		});

		testWidgets('displays initial counter value', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('increments counter when IncrementButton is pressed', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byType(IncrementButton));
			await tester.pump();

			verify(() => counterCubit.increment()).called(1);
		});
	});
}
