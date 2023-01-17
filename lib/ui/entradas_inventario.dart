import 'package:best_architecture_challenge/bloc/movimientos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntradasMovimiento extends StatelessWidget {
  const EntradasMovimiento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movimientos"),
        actions: [
          IconButton(onPressed: (){
            context.read<MovimientosCubit>().fechData();

          },
          icon: Icon(Icons.update))
        ],
      ),
      body: BlocBuilder<MovimientosCubit, MovimientoState>(
        builder: (_, state) {
          if(state is MovimientoLoadingState)
            return Center(child: CircularProgressIndicator());
          if(state is MovimientoLoadedState)
          return ListView.builder(
            itemCount: state.listMovimientos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.listMovimientos[index].marca!),
              );
            },
          );
          if(state is MovimientoErrorState)
            return ListTile(
              title: Text("Error"),
            );
          return SizedBox();
        },
      ),
    );
  }
}
