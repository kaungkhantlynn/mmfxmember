import 'package:equatable/equatable.dart';

import '../../../models/author/public_posts_model.dart';

abstract class PublicPostsState extends Equatable{
  PublicPostsState();

  @override
  List<Object> get props => [];
}

class PublicPostsInitialized extends PublicPostsState {}

class PublicPostsLoading extends PublicPostsState {
}

class PublicPostsSuccess extends PublicPostsState {
  final PublicPostsModel publicPostsModel;
  PublicPostsSuccess({required this.publicPostsModel});
}

class PublicPostsError extends PublicPostsState {
  final String errorMessage;
  PublicPostsError({required this.errorMessage});
}