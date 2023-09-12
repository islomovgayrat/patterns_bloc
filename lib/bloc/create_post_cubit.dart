import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patterns_bloc/services/http_service.dart';

import '../model/post_model.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());

  void apiPostCreate(Post post) async {
    emit(CreatePostLoading());
    final response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: 'Could not create post'));
    }
  }
}
