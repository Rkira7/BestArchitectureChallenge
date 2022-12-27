// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// CLASE PARA CONVERTIR DE JSON A MODELO - MODELO A JSON
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['id'],
      json['title'],
      json['body'],
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
