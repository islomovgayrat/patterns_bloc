import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/update_post_cubit.dart';
import 'package:patterns_bloc/models/post_model.dart';

import '../views/view_of_update.dart';

class UpdatePage extends StatefulWidget {
  Post? post;
  UpdatePage({super.key, this.post});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  finish(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      Navigator.of(context).pop('result');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.post!.title!;
    bodyController.text = widget.post!.body!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: BlocProvider(
        create: (context) => UpdatePostCubit(),
        child: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if (state is UpdatePostLoading) {
              String title = titleController.text.toString();
              String body = bodyController.text.toString();
              Post post = Post(
                id: widget.post!.id,
                title: title,
                body: body,
                userId: widget.post!.userId,
              );
              return viewOfUpdate(
                  true, context, post, titleController, bodyController);
            }
            if (state is UpdatePostLoaded) {
              finish(context);
            }
            if (state is UpdatePostError) {}
            return viewOfUpdate(
                false, context, widget.post!, titleController, bodyController);
          },
        ),
      ),
    );
  }
}
