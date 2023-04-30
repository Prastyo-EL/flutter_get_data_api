import 'package:flutter_get_data_api/data/model/book_response/detail_book_response_model.dart';

abstract class DetailRepository {
  Future<DetailBookByUrlResponse?> getUrl(String isbn13);

  // Future<void> addUrl();
}