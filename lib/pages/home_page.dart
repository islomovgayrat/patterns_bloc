import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:patterns_bloc/bloc/list_post_cubit.dart';
import 'package:patterns_bloc/pages/create_page.dart';
import 'package:patterns_bloc/views/view_of_home.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';
import '../views/item_of_post.dart';
import '../views/view_of_error.dart';
import '../views/view_of_loading.dart';
import '../views/view_of_postlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'home_id';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  List<Post> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListPostCubit, ListPostState>(
        builder: (BuildContext context, ListPostState state) {
          if (state is ListPostError) {
            return viewOfHome(items, false); //error
          }

          if (state is ListPostLoaded) {
            items = state.posts!;
            return viewOfHome(items, false); //posts
          }

          return viewOfHome(items, true); //loading
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CreatePage()));
          BlocProvider.of<ListPostCubit>(context).apiPostList();
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
