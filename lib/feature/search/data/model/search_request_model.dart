import '../../domain/entity/search_request_entity.dart';

class SearchRequestModel extends SearchRequestEntity {
  SearchRequestModel({required super.query, super.page});

  Map<String, dynamic> toJson() => {
        "query": query,
        "page": page,
      };

  factory SearchRequestModel.opj(SearchRequestEntity searchRequestEntity) =>
      SearchRequestModel(
          query: searchRequestEntity.query, page: searchRequestEntity.page);
}
