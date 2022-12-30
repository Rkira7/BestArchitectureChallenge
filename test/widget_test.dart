// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:best_architecture_challenge/bloc/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:best_architecture_challenge/main.dart';

import 'bloc_test/post_cubit_test.dart';

void main() {
  testWidgets('Mostrsar en la pantalla 2 elementos', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<PostCubit>(
        create: (context) => PostCubit(MockRepoImp()),
        child: const MaterialApp(
          home: PostPage(title: 'Titulo'),
        ),
      ),
    );

    await tester.pumpAndSettle();
    //Asegúrese de que los widgets aparezcan en la pantalla exactamente una vez. Para este propósito, utilice el .findsOneWidget
    final buscarTitle = find.text('Titulo');
    expect(buscarTitle, findsOneWidget); //BUSCA EL TEXTO

    //expect(find.byKey(const Key('1')), findsOneWidget); //Encuentra un widget con un específico Key
    //expect(find.byKey(Key("3")), findsOneWidget);
  });
}
