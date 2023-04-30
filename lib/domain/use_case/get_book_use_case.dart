import 'package:flutter_get_data_api/data/model/book_response/book_response_model.dart';
import 'package:flutter_get_data_api/domain/repository/book_repository.dart';

class GetBookUseCase{
  final BookRepository _repository;

  const GetBookUseCase(this._repository);

  Future<BookNameResponse?> call() async => await _repository.getBook();
}