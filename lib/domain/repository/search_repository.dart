
import '../../data/model/book_response/search_book_response_model.dart';

abstract class SearchRepository {
  Future<SearchBookByNameResponse?> getSearch(String isbn13);

}