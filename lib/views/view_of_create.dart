import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/create_post_cubit.dart';
import 'package:patterns_bloc/model/post_model.dart';

finish(BuildContext context) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context).pop('result');
  });
}

Widget viewOfCreate(
  bool isLoading,
  BuildContext context,
  TextEditingController titleController,
  TextEditingController bodyController,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(
                hintText: 'Body',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String title = titleController.text.toString().trim();
                String body = bodyController.text.toString().trim();
                Post post = Post(title: title, body: body, userId: 1);
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
                finish(context);
              },
              child: const Text('Create'),
            ),
          ],
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const SizedBox.shrink(),
      ],
    ),
  );
}
