import 'bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter value is :',
              style: TextStyle(fontSize: 20.0),
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, count) {
                return Center(
                  child: Text(
                    '${count.count}',
                    style: TextStyle(fontSize: 28.0),
                  ),
                );
              },
            ),
            SizedBox(
            height: 40.0,
          ),
            const Text(
              'Reset the Counter here',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'btn4',
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Reset());
            },
            child: Icon(Icons.refresh),
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            heroTag: 'btn5',
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.navigate_before),
          ),
        ],
      ),
    );
  }
}
