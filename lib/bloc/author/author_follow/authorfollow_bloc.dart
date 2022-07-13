import 'package:bloc/bloc.dart';

import '../../../data/repository/author_repository.dart';
import '../../../models/author/author_follow_model.dart';
import 'authorfollow_event.dart';
import 'authorfollow_state.dart';


class AuthorFollowBloc extends Bloc<AuthorFollowEvent,AuthorFollowState>{
  AuthorRepository authorRepository;
  AuthorFollowBloc(this.authorRepository) : super(AuthorFollowInitialized());
  @override
  Stream<AuthorFollowState> mapEventToState(
      AuthorFollowEvent event
      ) async*{
    if(event is FollowAuthor){
      yield AuthorFollowLoading();
      try{
        AuthorFollowModel authorFollowModel=await authorRepository.followAuthor(event.id);

        yield AuthorFollowSuccess(authorFollowModel: authorFollowModel);
      }
      catch (e){
        yield AuthorFollowError(errorMessage: e.toString());
      }
    }
  }
}