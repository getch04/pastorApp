import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PaginationProvider<T> {
  final PagingController<int, T> pagingController =
      PagingController(firstPageKey: 1);
  final String endpoint;
  final T Function(Map<String, dynamic>) fromJson;
  final String apiKey;

  PaginationProvider(
      {required this.endpoint, required this.fromJson, required this.apiKey}) {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final response = await http.get(
        Uri.parse('$endpoint&page=$pageKey'),
        headers: {'key': apiKey},
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final items =
            (data['data'] as List).map((item) => fromJson(item)).toList();
        final isLastPage = data['meta']['pagination']['current_page'] ==
            data['meta']['pagination']['total_pages'];
        if (isLastPage) {
          pagingController.appendLastPage(items);
        } else {
          final nextPageKey = pageKey + 1;
          pagingController.appendPage(items, nextPageKey);
        }
      } else {
        pagingController.error = 'Error fetching data';
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void dispose() {
    pagingController.dispose();
  }
}
