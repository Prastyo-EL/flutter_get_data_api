import 'package:flutter_get_data_api/data/datasource/book_remote_datasource.dart';
import 'package:flutter_get_data_api/data/model/book_response/search_book_response_model.dart';
import '../../domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{
  final BookRemoteDatasource _remoteDatasource;

  const SearchRepositoryImpl(this._remoteDatasource);

  @override

  Future<SearchBookByNameResponse?> getSearch(String isbn13) async => await _remoteDatasource.getSearch(isbn13);


}