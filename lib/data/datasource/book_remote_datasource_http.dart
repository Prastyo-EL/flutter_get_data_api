import 'dart:convert';
import 'dart:developer';
import 'package:flutter_get_data_api/data/datasource/book_remote_datasource.dart';
import 'package:flutter_get_data_api/data/model/book_response/book_response_model.dart';
import 'package:flutter_get_data_api/data/model/book_response/detail_book_response_model.dart';
import 'package:flutter_get_data_api/data/model/book_response/search_book_response_model.dart';
import 'package:http/http.dart' as client;
import 'package:flutter_get_data_api/constants/constants.dart';

class BookRemoteDatasourceHttp implements BookRemoteDatasource{

  @override
  Future<BookNameResponse?> getBook()async {
   try{
     final url= Constants.allBookUrl;

     final result=await client.get(Uri.parse(url));

     if(result.statusCode==200){
       return BookNameResponse.fromJson(json.decode(result.body));
     }
   }catch (error, stacktrace){
     log('Error on Get Book $error', stackTrace: stacktrace);
   }
   return null;
  }


  @override
  Future<DetailBookByUrlResponse?> getUrl(String isbn13) async{
    try{
      final url= Constants.detailBookUrl+isbn13;

      final result=await client.get(Uri.parse(url));

      if(result.statusCode==200){
        return DetailBookByUrlResponse.fromJson(json.decode(result.body));
      }
    }catch (error, stacktrace){
      log('Error on Get Book $error', stackTrace: stacktrace);
    }
    return null;
  }

  @override
  Future<SearchBookByNameResponse?> getSearch(String isbn13) async{
    try{
      final url= Constants.bookSearch+isbn13;

      final result=await client.get(Uri.parse(url));

      if(result.statusCode==200){
        return SearchBookByNameResponse.fromJson(json.decode(result.body));
      }
    }catch (error, stacktrace){
      log('Error on Get Book $error', stackTrace: stacktrace);
    }
    return null;
  }

}