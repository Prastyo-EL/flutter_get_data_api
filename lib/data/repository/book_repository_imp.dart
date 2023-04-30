import 'package:flutter_get_data_api/data/model/book_response/book_response_model.dart';
import 'package:flutter_get_data_api/domain/repository/book_repository.dart';

import '../datasource/book_remote_datasource.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDatasource _remoteDatasource;

  const BookRepositoryImpl(this._remoteDatasource);

  @override
  Future<BookNameResponse?> getBook() async => await _remoteDatasource.getBook();

}