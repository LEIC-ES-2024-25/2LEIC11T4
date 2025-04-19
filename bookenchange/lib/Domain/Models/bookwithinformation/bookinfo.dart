import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookinfo.freezed.dart';
part 'bookinfo.g.dart';

@freezed
abstract class Bookinfo with _$Bookinfo {
  const factory Bookinfo({
    required String ISBN,
    required String name,
    required List<String> authors,
    required String Publisher,
  }) = _Bookinfo;

  factory Bookinfo.fromJson(Map<String, dynamic> json) =>
      _$BookinfoFromJson(json);
}
