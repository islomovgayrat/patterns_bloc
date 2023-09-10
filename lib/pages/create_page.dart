import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/create_post_cubit.dart';

import '../views/view_of_create.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var title = TextEditingController();
  var body = TextEditingController();

  finish(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.of(context).pop('result');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Craete Page'),
      ),
      body: BlocProvider(
        create: (context) => CreatePostCubit(),
        child: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (BuildContext context, CreatePostState state) {
            if (state is CreatePostLoading) {
              return viewOfCreate(true, context, title, body);
            }

            if (state is CreatePostLoaded) {
              finish(context);
            }

            if (state is CreatePostError) {}

            return viewOfCreate(false, context, title, body);
          },
        ),
      ),
    );
  }
}
