import 'package:flutter_get_data_api/data/model/book_response/book_response_model.dart';

abstract class BookRepository {
  Future<BookNameResponse?> getBook();

  // Future<void> addBook();
}