import 'package:bloc/bloc.dart';
import '../../../data/repository/author_repository.dart';
import '../../../models/author/followed_author_list.dart';
import 'authorfollowlist_bloc.dart';
import 'authorfollowlist_state.dart';

class FollowedAuthorListBloc extends Bloc<FollowedAuthorListEvent,FollowedAuthorListState>{
  AuthorRepository authorRepository;
  FollowedAuthorListBloc(this.authorRepository) : super(FollowedAuthorListInitialized());
  @override
  Stream<FollowedAuthorListState> mapEventToState(
      FollowedAuthorListEvent event
      ) async*{
    if(event is FetchFollowedAuthorList){
      yield FollowedAuthorListLoading();
      try{
        FollowedAuthorList followedAuthorList=await authorRepository.getFollowedAuthorList();

        yield FollowedAuthorListSuccess(followedAuthorList: followedAuthorList);
      }
      catch (e){
        yield FollowedAuthorListError(errorMessage: e.toString());
      }
    }
  }
}