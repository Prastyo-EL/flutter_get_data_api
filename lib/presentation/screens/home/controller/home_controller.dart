import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_get_data_api/constants/constants.dart';
import 'package:flutter_get_data_api/data/model/book/book_model.dart';
import 'package:flutter_get_data_api/domain/use_case/get_book_use_case.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as client;
import '../../../../data/model/book_response/book_response_model.dart';

class HomeController extends GetxController{

  HomeController(GetBookUseCase getBookUseCase);

  Rx<List<Book>> books = Rx([]);
  Rx<TextEditingController> searchController=Rx(TextEditingController());



  void getBookV2() async {
    try {
      final url = Constants.allBookUrl;

      final result = await client.get(Uri.parse(url));

      if (result.statusCode == 200) {
        final bookNameResponse = BookNameResponse.fromJson(json.decode(result.body));
        books(bookNameResponse.books);
        update();
      }
    } catch (error, stacktrace) {
      log('Error on GetBook $error', stackTrace: stacktrace);
    }
  }

void getSearchQuery(){
    update();
}
}