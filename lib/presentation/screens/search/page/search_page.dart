
import 'package:flutter/material.dart';
import 'package:flutter_get_data_api/data/datasource/book_remote_datasource_http.dart';
import 'package:flutter_get_data_api/data/model/book/book_model.dart';
import 'package:flutter_get_data_api/domain/use_case/get_search_use_case.dart';
import 'package:flutter_get_data_api/data/repository/search_repository_imp.dart';
import 'package:flutter_get_data_api/presentation/screens/detail/page/detail_page.dart';
import 'package:flutter_get_data_api/presentation/screens/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final String query;
    SearchPage({super.key, required this.query});

  final _controller = CariController(
      GetSearchBookUseCase(
          SearchRepositoryImpl(
              BookRemoteDatasourceHttp())));


void navigationToDetail(BuildContext context,Book book){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(detail: book),
  ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder(
            init: _controller,
            initState: (state) => _controller.getSearch(query),
            builder: (context) {
              return Column(
                children: [
                  if(_controller.searchBooks.value.isNotEmpty )
                    Expanded(
                      child:
                      ListView.separated(
                          itemCount: _controller.searchBooks.value.length,
                          separatorBuilder: (context,index) =>
                          const SizedBox(height: 16),
                          itemBuilder: (context,index){
                            final book = _controller.searchBooks.value[index];

                            return InkWell(
                              onTap: () =>
                                  navigationToDetail(context,book),
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
                                      Text(
                                        book.url ?? "No subtitle",
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        book.isbn13 ?? "No isbn13",
                                      ),
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
            }),
      ),
    );
  }
}