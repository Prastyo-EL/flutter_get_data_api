import 'dart:convert';
import 'dart:developer';
import 'package:flutter_get_data_api/constants/constants.dart';
import 'package:flutter_get_data_api/data/model/book/book_model.dart';
import 'package:flutter_get_data_api/data/model/book_response/search_book_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as client;
import '../../../../domain/use_case/get_search_use_case.dart';

class CariController extends GetxController{
  //
  //
  CariController(GetSearchBookUseCase getSearchBookUseCase);
  //
    Rx<List<Book>> searchBooks = Rx([]);
    //Rx<TextEditingController> searchController=Rx(TextEditingController());
  void getSearch(String query) async {
    try {
      final url = Constants.bookSearch + query;

      final result = await client.get(Uri.parse(url));

      if (result.statusCode == 200) {
        final searchBookByNameResponse = SearchBookByNameResponse.fromJson(
            json.decode(result.body));
        searchBooks(searchBookByNameResponse.books?.cast<Book>());
        update();
      }
    } catch (error, stacktrace) {
      log('Error on GetBook $error', stackTrace: stacktrace);
        }
    }
  }
