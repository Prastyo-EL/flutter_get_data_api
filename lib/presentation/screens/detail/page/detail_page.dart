import 'package:flutter/material.dart';
import 'package:flutter_get_data_api/data/datasource/book_remote_datasource_http.dart';
import 'package:flutter_get_data_api/data/model/book/book_model.dart';
import 'package:flutter_get_data_api/data/repository/detail_repository_imp.dart';
import 'package:flutter_get_data_api/domain/use_case/get_detail_use_case.dart';
import 'package:flutter_get_data_api/presentation/screens/detail/controller/detail_controller.dart';
import 'package:get/get.dart';


class DetailPage extends StatelessWidget {
  final Book detail;
   DetailPage({super.key, required this.detail});
  final _controller = DetailController(
      GetDetailUseCase(
        DetailRepositoryImpl(
          BookRemoteDatasourceHttp(),
        ),
      ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Book'),
      ),
      body: GetBuilder<DetailController>(
        init: _controller,
          initState: (state) => _controller.getDetailBook(detail.isbn13 ?? ''),
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child:
                    Padding(
                        padding: const EdgeInsets.all(0),
                        child: SizedBox(
                            child: Expanded(
                                child: Text(
                                  '${_controller.details.value.title}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32),
                                ))
                        )),
                    ),
                    Expanded(child:
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.network(
                        '${_controller.details.value.image}',
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ),

          ],
                      ),

                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: Expanded(
                            child: Row(
                              children: [
                                const Expanded(child: Text('Subititle')),
                                Expanded(child: Text(
                                  '${_controller.details.value.subtitle}')),
          ],
          ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Authors')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.authors}')),

                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Publisher')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.publisher}')),

                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Language')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.language}')),

                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Pages')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.pages}')),

                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Year')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.year}')),

                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Rating')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.rating}')),

                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Description')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.desc}')),

                                  ],
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            child: Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(child: Text('Price')),
                                    Expanded(child: Text(
                                        '${_controller.details.value.price}')),

                                  ],
                                ))),
                      ),

          ],
          )

          ],

          )

          );
        },
      ),
    );
  }
}
