
import 'package:best_architecture_challenge/bloc/post_cubit.dart';
import 'package:best_architecture_challenge/main.dart';
import 'package:best_architecture_challenge/model/post.dart';
import 'package:best_architecture_challenge/repository/repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

//MOCK PARA INYECTAR EN PRUEBAS EN LUGAR DE LA API
class MockRepoImp extends Repository{
  @override
  Future<List<Post>> getPostList() async {
    print("Test");
    return [
      Post(2, "titulo", "Contenido"),
      Post(1, "titulo2", "Contenido2"),
      Post(3, "Atitulo2", "Contenido2"),
    ];
  }
}

void main(){
  group("post cubit test", (){
    blocTest<PostCubit, PostState>("estan cargando correctamente",
        build: () => PostCubit(MockRepoImp()), //IMPLEMENTA LA LISTA MOCK Y  NO LA API
        expect: () => [
          isA<PostReady>()
        ],
        verify: (cubit){
          final readyState = cubit.state as PostReady;

          expect(readyState.listPost.length, 3);
          expect(readyState.listPost[0].id, 1);
          expect(readyState.listPost[1].id, 2);

        }
    );

    blocTest<PostCubit, PostState>("estan ordenar por titulo",
        build: () => PostCubit(MockRepoImp()), //IMPLEMENTA LA LISTA MOCK Y  NO LA API
        act: (cubit) => cubit.sort(SortOptions.title), // SE MANDA LLAMAR EL METODO sort
        expect: () => [
          //UNA PARA BUILD Y  OTRO PARA EL act
          isA<PostReady>(),
          isA<PostReady>()
        ],
        verify: (cubit){
          final readyState = cubit.state as PostReady;

          //SE VERIFICA QUE SE ORDENE POR TITULO
          expect(readyState.listPost.length, 3);
          expect(readyState.listPost[0].id, 3);
          expect(readyState.listPost[2].id, 1);

        }
    );

  });
}