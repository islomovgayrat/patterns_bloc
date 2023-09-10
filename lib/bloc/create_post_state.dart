part of 'create_post_cubit.dart';

@immutable
abstract class CreatePostState {
  List<Object?> get props => [];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostLoaded extends CreatePostState {
  final bool? isCreated;
  CreatePostLoaded({this.isCreated});
}

class CreatePostError extends CreatePostState {
  final error;
  CreatePostError({this.error});
}
