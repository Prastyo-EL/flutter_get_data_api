import 'dart:convert';
import 'dart:developer';
import 'package:flutter_get_data_api/domain/use_case/get_detail_use_case.dart';
import 'package:get/get.dart';

import '../../../../constants/constants.dart';
import 'package:http/http.dart' as client;

import '../../../../data/model/book_response/detail_book_response_model.dart';

class DetailController extends GetxController{

  // final GetDetailUseCase _getDetailUseCase;

  DetailController(GetDetailUseCase getDetailUseCase);

  Rx<DetailBookByUrlResponse> details = Rx(DetailBookByUrlResponse());
  // Rx<TextEditingController> detailController=Rx(TextEditingController());
  void getDetailBook(String isbn13) async{

    try{
      final url = Constants.detailBookUrl+isbn13;

      final result = await client.get(Uri.parse(url));

      if(result.statusCode==200){
        final detailBookByUrlResponse = DetailBookByUrlResponse.fromJson(json.decode(result.body));
        details(detailBookByUrlResponse);
        update();
      }
    }catch (error, stacktrace) {
      log('Error on GetBook $error', stackTrace: stacktrace);

    }
  }
}