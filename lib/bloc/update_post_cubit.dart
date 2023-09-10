import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patterns_bloc/services/http_service.dart';

import '../models/post_model.dart';

part 'update_post_state.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInitial());

  void apiPostUpdate(Post post) async {
    emit(UpdatePostLoading());
    final response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: 'Could not update post'));
    }
  }
}
