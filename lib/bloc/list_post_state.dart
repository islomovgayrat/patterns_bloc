part of 'list_post_cubit.dart';

@immutable
abstract class ListPostState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ListPostInitial extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  final List<Post>? posts;

  ListPostLoaded({this.posts});
}

class ListPostError extends ListPostState {
  final error;

  ListPostError({this.error});
}
