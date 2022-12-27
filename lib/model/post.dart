import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart'; //PARA UTILIZAR EL COMANDO "flutter pub run build_runner build" Y GENERAL LA CLASE

@JsonSerializable()
class Post extends Equatable { //PARA PODER COMPARAR OBJETOS
  late final id;
  late final title;
  late final body;

  Post(this.id, this.title, this.body);

  @override
  List<Object?> get props => [id, title, body]; //METODO CREADO POR EQUETABLE

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json); //MANDA LLAMAR EN LA CLASE post.g

  Map<String, dynamic> toJson() => _$PostToJson(this);

}