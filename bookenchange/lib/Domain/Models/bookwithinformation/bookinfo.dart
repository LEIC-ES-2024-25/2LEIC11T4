import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookinfo.freezed.dart';
part 'bookinfo.g.dart';

@freezed
class bookinfo with _$bookinfo {
  const factory bookinfo({
    required String ISBN,
    required String name,
    required List<String> authors,
    required String Publisher,
  }) = _bookinfo;

  factory bookinfo.fromJson(Map<String, Object?> json) =>
      _$bookinfoFromJson(json);
}
