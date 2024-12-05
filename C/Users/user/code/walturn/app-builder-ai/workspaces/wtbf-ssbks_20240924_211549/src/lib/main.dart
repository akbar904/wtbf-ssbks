
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'cubits/counter_cubit.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Counter App',
			home: BlocProvider(
				create: (context) => CounterCubit(),
				child: HomeScreen(),
			),
		);
	}
}
