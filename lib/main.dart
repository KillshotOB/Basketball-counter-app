import 'package:basketball_counter_app/cubit/counter_cubit.dart';
import 'package:basketball_counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const PointsCounter());
}

class PointsCounter extends StatelessWidget {
  const PointsCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterState>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Points Counter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // team A
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Team A', style: TextStyle(fontSize: 32)),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                          style: const TextStyle(fontSize: 150),
                        ),
                        // add 1 button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            // ignore: deprecated_member_use
                            primary: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: 'A', buttonNumber: 1);
                          },
                          child: const Text(
                            'Add 1 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        // add 2 button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: 'A', buttonNumber: 2);
                          },
                          child: const Text(
                            'Add 2 Point',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        // add 3 button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: 'A', buttonNumber: 3);
                          },
                          child: const Text(
                            'Add 3 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // mid line
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  // team B
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('Team B', style: TextStyle(fontSize: 32)),
                        Text(
                          '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                          style: const TextStyle(fontSize: 150),
                        ),
                        // add 1 button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            // ignore: deprecated_member_use
                            primary: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: 'B', buttonNumber: 1);
                          },
                          child: const Text(
                            'Add 1 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        // add 2 button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: 'B', buttonNumber: 2);
                          },
                          child: const Text(
                            'Add 2 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                        // add 3 button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // ignore: deprecated_member_use
                            primary: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            BlocProvider.of<CounterCubit>(context)
                                .TeamIncrement(team: 'B', buttonNumber: 3);
                          },
                          child: const Text(
                            'Add 3 Point ',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // reset button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  // ignore: deprecated_member_use
                  primary: Colors.orange,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  BlocProvider.of<CounterCubit>(context).reset();
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
      listener: (ctx, state) {
        if (state is CounterAIncrementState) {
        } else if (state is CounterBIncrementState) {}
      },
    );
  }
}
