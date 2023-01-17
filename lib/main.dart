import 'dart:convert';

import 'package:best_architecture_challenge/bloc/movimientos_cubit.dart';
import 'package:best_architecture_challenge/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/provider/movimiento_provider.dart';
import 'package:best_architecture_challenge/provider/rest_provider.dart';
import 'package:best_architecture_challenge/repository/repository.dart';
import 'package:best_architecture_challenge/repository/repositoryMovimientos.dart';
import 'package:best_architecture_challenge/ui/entradas_inventario.dart';
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

  RepositoryMovimiento repositoryMovimiento = RepositoryMovimientoImp(MovimientoProvider());
  MovimientosCubit movimientoCubit = MovimientosCubit(repositoryMovimiento);

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (_) => postCubit),

          BlocProvider(
              create: (_) => movimientoCubit)
        ],
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
  final String title;

  const PostPage({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EntradasMovimiento()));
            },
              child: Text(title)),
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
                //LO MISMO CON EL CALLBACK
                //onSelected:(SortOptions value) => context.read<PostCubit>().sort(value)),
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
