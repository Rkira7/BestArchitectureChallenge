
import 'package:best_architecture_challenge/model/reporteEntradas.dart';
import 'package:best_architecture_challenge/provider/movimiento_provider.dart';

abstract class RepositoryMovimiento{
  Future<List<Movimientos>> getMovimientos();
}

class RepositoryMovimientoImp extends RepositoryMovimiento{

  MovimientoProvider _movimientoProvider;
  RepositoryMovimientoImp(this._movimientoProvider);

  @override
  Future<List<Movimientos>> getMovimientos() => _movimientoProvider.getMovimientos();


}