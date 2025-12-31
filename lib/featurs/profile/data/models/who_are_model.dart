import 'package:e_commerce_fruits_hub/featurs/profile/domain/entitiys/who_are_entity.dart';

class WhoAreModel {
  final String whoAreText;

  WhoAreModel({required this.whoAreText});

  factory WhoAreModel.fromJson( Map<String, dynamic> json) {
    return WhoAreModel(whoAreText: json['whoAreText']);
  }
  WhoAreEntity toEntity() => WhoAreEntity(whoAreText: whoAreText);
}
