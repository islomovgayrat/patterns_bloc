import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_bloc/pages/update_page.dart';

import '../bloc/list_post_cubit.dart';
import '../bloc/update_post_cubit.dart';
import '../models/post_model.dart';

Widget itemOfPost(BuildContext context, Post post) {
  return Slidable(
    startActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => UpdatePage(
                  post: post,
                ),
              ),
            );
            BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Update',
        ),
      ],
    ),
    endActionPane: ActionPane(
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title!.toUpperCase()),
          const SizedBox(height: 5),
          Text(post.body.toString()),
        ],
      ),
    ),
  );
}
