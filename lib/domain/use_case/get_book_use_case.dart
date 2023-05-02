import 'package:flutter_get_data_api/data/model/book_response/book_response_model.dart';
import 'package:flutter_get_data_api/domain/repository/book_repository.dart';

class GetBookUseCase{
  final BookRepository _bookRepository;

  const GetBookUseCase(this._bookRepository);

  Future<BookNameResponse?> call() async => await _bookRepository.getBook();
}