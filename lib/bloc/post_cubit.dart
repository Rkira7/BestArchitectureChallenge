
import 'package:best_architecture_challenge/main.dart';
import 'package:best_architecture_challenge/model/post.dart';
import 'package:best_architecture_challenge/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostCubit extends Cubit<PostState>{
  Repository _repository;

  List<Post> listPost = [];
  SortOptions _sortby = SortOptions.id; //ORDENAR POR DEFAULT ID

  //CON EL CONTRUCTOR SE INCIAL POR DEFAULT EL ESTADO PostLoadin
  //Y SE MANDA LLAMAR LA FUNCION _fetchData
  PostCubit(this._repository) : super(PostLoading()){
    _fechData();
  }

  //OBTENER LOS DATOS
  Future<void> _fechData() async{
    emit(PostLoading());
    //MANDA LLAMAR AL provider Y ESTE A SU VEZ A LA API
    listPost =  await _repository.getPostList();
    sort(_sortby);
  }

  //ORDENAR LOS POST
  void sort(SortOptions sortby){
    _sortby = sortby;
    switch(_sortby){
      case SortOptions.title: // ORDENAR POS TITULO
        listPost.sort((a, b) => a.title.compareTo(b.title));
        break;
      case SortOptions.id: // ORDENAR POR ID
        listPost.sort((a, b) => a.id.compareTo(b.id));
        break;
    }
    emit(PostReady(listPost, _sortby));

  }
}

abstract class PostState extends Equatable{

  @override
  List<Object?> get props => [];
}

//ESTADO DE CARGANDO
class PostLoading extends PostState{}

//ESTADO CUANDO
class PostReady extends PostState{
  final List<Post> listPost;
  final SortOptions sortby;

  PostReady(this.listPost, this.sortby);

  @override
  List<Object?> get props => [listPost, sortby];
}