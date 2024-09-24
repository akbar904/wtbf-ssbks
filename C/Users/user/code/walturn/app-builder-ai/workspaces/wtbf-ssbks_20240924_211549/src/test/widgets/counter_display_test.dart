
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/widgets/counter_display.dart';
import 'package:counterapp/cubits/counter_cubit.dart';

void main() {
	group('CounterDisplay Widget Tests', () {
		testWidgets('displays the initial counter value', (WidgetTester tester) async {
			// Arrange
			final counterCubit = CounterCubit();
			
			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: CounterDisplay(),
					),
				),
			);

			// Assert
			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('displays updated counter value after increment', (WidgetTester tester) async {
			// Arrange
			final counterCubit = CounterCubit();
			
			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: CounterDisplay(),
					),
				),
			);
			counterCubit.increment(); // Increment counter
			await tester.pump(); // Rebuild widget

			// Assert
			expect(find.text('10'), findsOneWidget);
		});
	});
}
