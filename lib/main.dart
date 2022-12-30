import 'dart:convert';

import 'package:best_architecture_challenge/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/provider/rest_provider.dart';
import 'package:best_architecture_challenge/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'model/post.dart';

//PARA ORDENAR EL REPORTE DE POST
enum SortOptions { id, title }

void main() {
  Repository repository = RepositoryImp(RestProvider());
  PostCubit postCubit = PostCubit(repository);

  runApp(
      BlocProvider(
        create: (_) => postCubit,
        child: MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: PostPage(title: 'FlutterTaipei :)'),
    );
  }
}

class PostPage extends StatelessWidget {
  PostPage({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            PopupMenuButton<SortOptions>(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) =>
                [
                  PopupMenuItem(
                    child: Text('Orden por Id'),
                    value: SortOptions.id,
                  ),
                  PopupMenuItem(
                    child: Text('Ordenar por Titulo'),
                    value: SortOptions.title,
                  )
                ],
                onSelected: context.read<PostCubit>().sort),
          ],
        ),
        body: BlocBuilder<PostCubit, PostState>(
            builder: (_, state){
              if(state is PostReady){
                return ListView.separated(
                  itemCount: state.listPost.length,
                  itemBuilder: (context, index) {
                   Post items = state.listPost[index];
                    return Container(
                        padding: EdgeInsets.all(8),
                        child: RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: "${items.id}. ${items.title}",
                                style: TextStyle(fontSize: 18, color: Colors.red),
                              ),
                              TextSpan(
                                text: '\n' + items.body,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                );

              }
              return Center(child: CircularProgressIndicator(),);
            }
        )


        );
  }

}
