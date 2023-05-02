import 'package:flutter_get_data_api/data/model/book_response/detail_book_response_model.dart';
import 'package:flutter_get_data_api/domain/repository/detail_repository.dart';

class GetDetailUseCase{
  final DetailRepository _detailRepository;

  const GetDetailUseCase(this._detailRepository);

  Future<DetailBookByUrlResponse?> call(String isbn13) async => await _detailRepository.getUrl(isbn13);
}