import 'package:bloc/bloc.dart';

import '../../../data/repository/author_repository.dart';
import '../../../models/author/public_posts_model.dart';
import 'publicposts_event.dart';
import 'publicposts_state.dart';
class PublicPostsBloc extends Bloc<PublicPostsEvent,PublicPostsState>{
  AuthorRepository authorRepository;
  PublicPostsBloc(this.authorRepository) : super(PublicPostsInitialized());
  @override
  Stream<PublicPostsState> mapEventToState(
      PublicPostsEvent event
      ) async*{
    if(event is FetchPublicPosts){
      yield PublicPostsLoading();
      try{
        PublicPostsModel publicPostsModel=await authorRepository.getPublicPosts();

        yield PublicPostsSuccess(publicPostsModel: publicPostsModel);
      }
      catch (e){
        yield PublicPostsError(errorMessage: e.toString());
      }
    }
  }
}