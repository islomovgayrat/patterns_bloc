part of 'update_post_cubit.dart';

@immutable
abstract class UpdatePostState {
  List<Object?> get props => [];
}

class UpdatePostInitial extends UpdatePostState {}

class UpdatePostLoading extends UpdatePostState {}

class UpdatePostLoaded extends UpdatePostState {
  final bool? isUpdated;
  UpdatePostLoaded({this.isUpdated});
}

class UpdatePostError extends UpdatePostState {
  final error;
  UpdatePostError({this.error});
}
