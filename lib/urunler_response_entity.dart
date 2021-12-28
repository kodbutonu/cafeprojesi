import 'package:cafe/urun_entity.dart';

class UrunlerResponse {
  final List<UrunEntity> data;
  final int count;

  UrunlerResponse({required this.data, required this.count});

  factory UrunlerResponse.fromJson(Map<String, dynamic> json) {
    return UrunlerResponse(
        data: (json['data'] as List).map((i) {
          return UrunEntity.fromJson(i);
        }).toList(),
        count: json['count']);
  }
}
