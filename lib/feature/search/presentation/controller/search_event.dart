part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchPhotoEvent extends SearchEvent {
  SearchRequestEntity searchRequestEntity;

  SearchPhotoEvent(this.searchRequestEntity);
}

class SearchMorePhoto extends SearchEvent {
  SearchRequestEntity searchRequestEntity;

  SearchMorePhoto(this.searchRequestEntity);
}
