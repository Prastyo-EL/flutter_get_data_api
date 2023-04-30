import 'package:flutter_get_data_api/data/model/book_response/book_response_model.dart';
import 'package:flutter_get_data_api/data/model/book_response/detail_book_response_model.dart';

import '../model/book_response/search_book_response_model.dart';
abstract class BookRemoteDatasource {
  Future<BookNameResponse?> getBook();
  Future<DetailBookByUrlResponse?> getUrl(String isbn13);
  Future<SearchBookByNameResponse?> getSearch(String isbn13);
}