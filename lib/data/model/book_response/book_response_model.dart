
import 'package:flutter_get_data_api/data/model/book/book_model.dart';

class BookNameResponse {
  BookNameResponse({
    this.error,
    this.total,
    this.books,
  });

  final String? error;
  final String? total;
  final List<Book>? books;

  factory BookNameResponse.fromJson(Map<String, dynamic> json) => BookNameResponse(
    error: json["error"],
    total: json["total"],
    books: json["books"] == null ? [] : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "total": total,
    "books": books == null ? [] : List<dynamic>.from(books!.map((x) => x.toJson())),
  };
}
