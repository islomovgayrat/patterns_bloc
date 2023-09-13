import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/model/post_model.dart';

import '../bloc/update_post_cubit.dart';

finish(BuildContext context) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    Navigator.of(context).pop('result');
  });
}

Widget viewOfUpdate(
  bool isLoading,
  BuildContext context,
  Post post,
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
                Post post1 = Post(
                    id: post.id,
                    title: titleController.text,
                    body: bodyController.text,
                    userId: post.userId);
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post1);
                finish(context);
              },
              child: const Text('Update'),
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
