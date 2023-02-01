
import 'bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter BLoC',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage(title: 'Flutter BloC Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count is :',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            child: Icon(Icons.navigate_next),
          ),
           SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            heroTag: 'btn2',
              child: const Icon(Icons.add),
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(Increment());
              }),
               SizedBox(
            height: 15.0,
          ),
          FloatingActionButton(
            heroTag: 'btn3',
            onPressed: () {
              context.read<CounterBloc>().add(Decrement());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
