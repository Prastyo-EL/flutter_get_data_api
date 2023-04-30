import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_get_data_api/constants/constants.dart';
import 'package:flutter_get_data_api/data/model/book/book_model.dart';
import 'package:flutter_get_data_api/domain/use_case/get_book_use_case.dart';
import 'package:flutter_get_data_api/domain/use_case/get_detail_use_case.dart';
import 'package:flutter_get_data_api/domain/use_case/get_search_use_case.dart';
import 'package:flutter_get_data_api/data/model/book_response/detail_book_response_model.dart';
import 'package:flutter_get_data_api/data/model/book_response/search_book_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as client;
import '../../../../data/model/book_response/book_response_model.dart';
import 'package:flutter_get_data_api/presentation/screens/search/page/search_page.dart';

import 'package:flutter_get_data_api/presentation/screens/search/controller/search_controller.dart';

class HomeController extends GetxController{
  final GetBookUseCase _getBookUseCase;
  final GetDetailUseCase _getDetailUseCase;
  // final GetSearchBookUseCase _getSearchBookUseCase;


  HomeController(this._getBookUseCase, this._getDetailUseCase);

  Rx<List<Book>> books = Rx([]);
  Rx<TextEditingController> searchController=Rx(TextEditingController());

  // Rx<List<DetailBookByUrlResponse>> details = Rx([]);
  // Rx<TextEditingController> detailController=Rx(TextEditingController());


  // Rx<List<SearchBookByNameResponse>> searchBooks = Rx([]);
  // Rx<TextEditingController> search_Controller = Rx(TextEditingController());


  void getBook() async{
    final result=await _getBookUseCase.call();

    if(result!=null){
      books(result.books);
      update();
    }
  }

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
  // void getDetail2(String isbn13) async{
  //   try{
  //     final url = Constants.detailBookUrl+isbn13;
  //
  //     final result = await client.get(Uri.parse(url));
  //
  //     if(result.statusCode==200){
  //       final detailBookByUrlResponse = DetailBookByUrlResponse.fromJson(json.decode(result.body));
  //       details(detailBookByUrlResponse.isbn13 as List<DetailBookByUrlResponse>?);
  //       update();
  //     }
  //   }catch (error, stacktrace) {
  //     log('Error on GetBook $error', stackTrace: stacktrace);
  //
  //   }
  // }
  // void getDetail(String isbn13) async{
  //   final result= await _getDetailUseCase.call(isbn13);
  //
  //   if(result!=null){
  //     details(result.url as List<DetailBookByUrlResponse>?);
  //     update();
  //   }
  // }
  // void getSearch(String isbn13) async{
  //   final result= await _getSearchBookUseCase.call(isbn13);
  //
  //   if(result!=null){
  //     searchBooks(result.books as List<SearchBookByNameResponse>?);
  //     update();
  //   }
  // }
  // void getSearch2(String name) async{
  //   try{
  //     final url = Constants.bookSearch+name;
  //
  //     final result = await client.get(Uri.parse(url));
  //
  //     if(result.statusCode==200){
  //       final searchBookByNameResponse = SearchBookByNameResponse.fromJson(json.decode(result.body));
  //       searchBooks(searchBookByNameResponse.books as List<SearchBookByNameResponse>?);
  //       update();
  //     }
  //   }catch (error, stacktrace) {
  //     log('Error on GetBook $error', stackTrace: stacktrace);
  //   }
  // }
void getSearchQuery(){
    update();
}
void getBookByQuery(){
    final query = searchController.value.text;
    print(query);
}
}