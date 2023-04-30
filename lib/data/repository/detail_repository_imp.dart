import 'package:flutter_get_data_api/data/model/book_response/detail_book_response_model.dart';
import 'package:flutter_get_data_api/domain/repository/detail_repository.dart';

import '../datasource/book_remote_datasource.dart';

class DetailRepositoryImpl implements DetailRepository {
  final BookRemoteDatasource _remoteDatasource;

  const DetailRepositoryImpl(this._remoteDatasource);

  @override
  Future<DetailBookByUrlResponse?> getUrl(String isbn13) async => await _remoteDatasource.getUrl(isbn13);




}