
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.counterapp/widgets/increment_button.dart';
import 'package:com.example.counterapp/cubits/counter_cubit.dart';
import 'package:com.example.counterapp/models/counter_state.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}

void main() {
	group('IncrementButton Widget Tests', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('should display "Increment" text', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<CounterCubit>.value(
							value: counterCubit,
							child: IncrementButton(),
						),
					),
				),
			);

			expect(find.text('Increment'), findsOneWidget);
		});

		testWidgets('should call increment method when pressed', (WidgetTester tester) async {
			when(() => counterCubit.increment()).thenReturn(null);

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<CounterCubit>.value(
							value: counterCubit,
							child: IncrementButton(),
						),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => counterCubit.increment()).called(1);
		});
	});
}
