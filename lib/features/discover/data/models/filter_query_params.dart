class FilterQueryParams {
  FilterQueryParams({
    this.limit = 10,
    this.pageNumber = 1,
    this.searchQuery,
  });

  int limit;
  int pageNumber;
  String? searchQuery;

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['searchQuery'] = searchQuery;
    map['page'] = pageNumber;
    map['limit'] = limit;
    return map;
  }
}
