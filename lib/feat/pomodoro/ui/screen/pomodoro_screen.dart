import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/core/colors/colors.dart';
import 'package:learn/feat/pomodoro/ui/cubit/pomodoro_cubit.dart';
import 'package:learn/feat/pomodoro/ui/cubit/pomodoro_state.dart';

class PomodoroScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PomodoroCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PomodoroCubit, PomodoroState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 10, color: state.resetTime == true ? red : blue),

                      borderRadius: BorderRadius.all(Radius.circular(300)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.resetTime ? "reset" : "work"),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.hour >= 10
                                  ? state.hour.toString()
                                  : "0${state.hour}",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              ":",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              state.min >= 10
                                  ? state.min.toString()
                                  : "0${state.min}",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              ":",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              state.sec >= 10
                                  ? state.sec.toString()
                                  : "0${state.sec}",
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<PomodoroCubit>().start();
                        },
                        icon: Icon(Icons.start),
                      ),

                      IconButton(
                        onPressed: () {
                          context.read<PomodoroCubit>().pause();
                        },
                        icon: Icon(Icons.pause),
                      ),

                      IconButton(
                        onPressed: () {
                          context.read<PomodoroCubit>().restart();
                        },
                        icon: Icon(Icons.restart_alt),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
