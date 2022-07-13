import 'package:bloc/bloc.dart';
import '../../../data/repository/author_repository.dart';
import '../../../models/author/author_list_model.dart';
import 'authorlist_event.dart';
import 'authorlist_state.dart';

class AuthorListBloc extends Bloc<AuthorListEvent,AuthorListState>{
  AuthorRepository authorRepository;
  AuthorListBloc(this.authorRepository) : super(AuthorListInitialized());
  @override
  Stream<AuthorListState> mapEventToState(
      AuthorListEvent event
      ) async*{
    if(event is FetchAuthorList){
      yield AuthorListLoading();
      try{
        AuthorListModel authorListModel=await authorRepository.getAuthorList();

        yield AuthorListSuccess(authorListModel: authorListModel);
      }
      catch (e){
        yield AuthorListError(errorMessage: e.toString());
      }
    }
  }
}