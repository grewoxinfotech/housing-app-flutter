// PaginationMeta.dart
class PaginationMeta {
  final int total;
  final int currentPage;
  final int totalPages;
  final bool hasMore;
  final int fetchedAll;

  PaginationMeta({
    required this.total,
    required this.currentPage,
    required this.totalPages,
    required this.hasMore,
    required this.fetchedAll,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      total: json['total'],
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      fetchedAll: json['fetchedAll'],
      hasMore: json['hasMore'],
    );
  }
}

// PaginationResponse.dart
class PaginationResponse<T> {
  final List<T> items;
  final PaginationMeta meta;

  PaginationResponse({required this.items, required this.meta});

  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonModel,
  ) {
    var itemsJson = json['items'] as List;
    List<T> itemsList = itemsJson.map((i) => fromJsonModel(i)).toList();

    return PaginationResponse(
      items: itemsList,
      meta: PaginationMeta.fromJson(json['meta']),
    );
  }
}
