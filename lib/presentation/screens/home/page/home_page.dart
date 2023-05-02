
import 'package:flutter/material.dart';

import 'package:flutter_get_data_api/data/datasource/book_remote_datasource_http.dart';
import 'package:flutter_get_data_api/data/model/book/book_model.dart';
import 'package:flutter_get_data_api/presentation/screens/detail/page/detail_page.dart';
import 'package:flutter_get_data_api/presentation/screens/home/controller/home_controller.dart';
import 'package:flutter_get_data_api/data/repository/book_repository_imp.dart';
import 'package:flutter_get_data_api/domain/use_case/get_book_use_case.dart';
import 'package:get/get.dart';
import '../../search/page/search_page.dart';

class HomePage extends StatelessWidget{
// final DetailBookByUrlResponse detail;
// final Book book;
 HomePage({super.key});
//BookRemoteDatasourceDio(Dio())
final _controller = HomeController(
  GetBookUseCase(
    BookRepositoryImpl(
      BookRemoteDatasourceHttp())),
);

  void navigateSearch(BuildContext context){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPage(
            query: _controller.searchController.value.text,
          ),
    ));
  }

void navigateToDetail(BuildContext context, Book book){
  Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(detail: book),
  ));
}

@override
  Widget build(BuildContext context){
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: GetBuilder<HomeController>(
          init: _controller,
          initState: (state)=> _controller.getBookV2(),
        builder: (cont) {
          return Column(
            children: [
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: TextField(
                  controller: _controller.searchController.value,
                   onChanged: (value) => _controller.getBookV2(),
                   decoration: InputDecoration(
                     suffixIcon: IconButton(
                         onPressed: () => navigateSearch(context),
                         icon: const Icon(Icons.search),
                     ),
                   ),
              ),
               ),
              // Text(_controller.searchController.value.text),
              const SizedBox(height: 32),
              Expanded(
                child:
                ListView.separated(
                itemCount: _controller.books.value.length,
          separatorBuilder: (context,index) =>
          const SizedBox(height: 16),
          itemBuilder: (context,index){
          final book = _controller.books.value[index];

          return InkWell(
            onTap: () =>
              navigateToDetail(context,book),
            child: Row(children: [
            Container(
              height: 80,
            width: 80,
            color: Colors.cyan,
              child: Image.network('${book.image}'),
            ),
            const SizedBox(width: 8),
            Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
            book.title ?? "No title",
            style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            ),
            ),
            const SizedBox(height: 8),
            // Text(
            // book.url ?? "No subtitle",
            // ),
            // const SizedBox(height: 8),
            // Text(
            // book.isbn13 ?? "No isbn13",
            // ),
            ],
            ),
            ),
            ],
            ),
          );
        }),

              ),
              // Text(_controller.books.value.text),
              const SizedBox(height: 32),
            ],
          );
        }
      ),
    ),
  );
}
}