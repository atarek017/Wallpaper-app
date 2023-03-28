class SearchRequestEntity {
  String? query;
  int? page;

  SearchRequestEntity({this.query, this.page});

  SearchRequestEntity copyWith(
    String? query,
    int? page,
  ) =>
      SearchRequestEntity(query: query ?? this.query, page: page ?? this.page);
}
