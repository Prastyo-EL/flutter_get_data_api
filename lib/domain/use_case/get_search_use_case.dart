import 'package:flutter_get_data_api/data/model/book_response/search_book_response_model.dart';

import '../repository/search_repository.dart';

class GetSearchBookUseCase{
  final SearchRepository _repository;

  const GetSearchBookUseCase(this._repository);

  Future<SearchBookByNameResponse?> call(String isbn13) async => await _repository.getSearch(isbn13);
}