import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/list_post_cubit.dart';
import 'package:patterns_bloc/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (BuildContext context) {
          return ListPostCubit();
        },
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (_) => const HomePage(),
        // CreatePage.id: (_) => const CreatePage(),
        // UpdatePage.id: (_) => const UpdatePage(),
      },
    );
  }
}
