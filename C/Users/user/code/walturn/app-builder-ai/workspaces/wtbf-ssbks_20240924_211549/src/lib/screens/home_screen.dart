
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counterapp/cubits/counter_cubit.dart';
import 'package:counterapp/widgets/counter_display.dart';
import 'package:counterapp/widgets/increment_button.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter App'),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						CounterDisplay(),
						IncrementButton(),
					],
				),
			),
		);
	}
}
