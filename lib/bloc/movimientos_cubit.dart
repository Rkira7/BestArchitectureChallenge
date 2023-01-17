import 'dart:convert';

import 'package:best_architecture_challenge/model/Error.dart';
import 'package:best_architecture_challenge/model/reporteEntradas.dart';
import 'package:best_architecture_challenge/repository/repositoryMovimientos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovimientosCubit extends Cubit<MovimientoState>{
  RepositoryMovimiento _repositoryMovimiento;
  MovimientosCubit(this._repositoryMovimiento) : super(MovimientoInitialState());


  Future<void> fechData() async{
    try{
      emit(MovimientoLoadingState());
      List<Movimientos> listMovimientos = await _repositoryMovimiento.getMovimientos();
      emit(MovimientoLoadedState(listMovimientos));
    }
    catch(e){
      print(e);
      emit(MovimientoErrorState(ErrorApi.fromJson(e as Map<String, dynamic>)));
    }

  }

}

///STATES
abstract class MovimientoState extends Equatable{
  @override
  List<Object?> get props => [];
}

//CUANDO ESTA CARGANDO
class MovimientoInitialState extends MovimientoState{}
class MovimientoLoadingState extends MovimientoState{}


//CUANDO SE CARGO EMITE UNA LISTA
class MovimientoLoadedState extends MovimientoState{
  late List<Movimientos> listMovimientos;


  MovimientoLoadedState(this.listMovimientos);

  @override
  List<Object?> get props => [listMovimientos];
}

class MovimientoErrorState extends MovimientoState{
  ErrorApi errorApi;
  MovimientoErrorState(this.errorApi);

  @override
  List<Object?> get props => [errorApi];


}

