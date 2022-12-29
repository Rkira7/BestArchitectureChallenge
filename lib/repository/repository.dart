
import 'package:best_architecture_challenge/model/post.dart';
import 'package:best_architecture_challenge/provider/rest_provider.dart';

//CUANDO UNA CLASE ABSTRACTA NO TIENE NINGUNA IMPLEMENTACION
//LAS CLASES QUE EXTIENDAD DE ESTA CLASE
abstract class Repository{
  Future<List<Post>> getPostList();
}

class RepositoryImp extends Repository{
  final RestProvider _restProvider;

  RepositoryImp(this._restProvider);

  @override
  Future<List<Post>> getPostList() => _restProvider.getListaPost();


}