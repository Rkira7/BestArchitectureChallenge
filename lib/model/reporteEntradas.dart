class Movimientos {
  int? productoId;
  String? codigo;
  int? marcaId;
  String? marca;
  int? productoModeloId;
  int? modeloId;
  String? modelo;
  String? nombreImagen;
  String? url;
  int? categoriaProductoId;
  String? categoria;
  int? tipoTelefonoId;
  String? tipoTelefono;
  String? precioFactura;
  String? precioMinimo;
  String? precioMaximo;
  int? precioMayorista;
  int? precioSubdistribuidor;
  int? precioConsignacion;
  String? color;
  String? hexadecimal;
  int? tipoMovimientoInventarioId;
  String? tipoMovimiento;
  int? cantidad;
  String? fecha;
  String? personalOrigen;

  Movimientos(
      {this.productoId,
        this.codigo,
        this.marcaId,
        this.marca,
        this.productoModeloId,
        this.modeloId,
        this.modelo,
        this.nombreImagen,
        this.url,
        this.categoriaProductoId,
        this.categoria,
        this.tipoTelefonoId,
        this.tipoTelefono,
        this.precioFactura,
        this.precioMinimo,
        this.precioMaximo,
        this.precioMayorista,
        this.precioSubdistribuidor,
        this.precioConsignacion,
        this.color,
        this.hexadecimal,
        this.tipoMovimientoInventarioId,
        this.tipoMovimiento,
        this.cantidad,
        this.fecha,
        this.personalOrigen});

  Movimientos.fromJson(Map<String, dynamic> json) {
    productoId = json['producto_id'];
    codigo = json['codigo'];
    marcaId = json['marca_id'];
    marca = json['marca'];
    productoModeloId = json['productoModelo_id'];
    modeloId = json['modelo_id'];
    modelo = json['modelo'];
    nombreImagen = json['nombre_imagen'];
    url = json['url'];
    categoriaProductoId = json['categoriaProducto_id'];
    categoria = json['categoria'];
    tipoTelefonoId = json['tipo_telefono_id'];
    tipoTelefono = json['tipo_telefono'];
    precioFactura = json['precio_factura'];
    precioMinimo = json['precio_minimo'];
    precioMaximo = json['precio_maximo'];
    precioMayorista = json['precioMayorista'];
    precioSubdistribuidor = json['precioSubdistribuidor'];
    precioConsignacion = json['precioConsignacion'];
    color = json['color'];
    hexadecimal = json['hexadecimal'];
    tipoMovimientoInventarioId = json['tipoMovimientoInventario_id'];
    tipoMovimiento = json['tipo_movimiento'];
    cantidad = json['cantidad'];
    fecha = json['fecha'];
    personalOrigen = json['personal_origen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['producto_id'] = this.productoId;
    data['codigo'] = this.codigo;
    data['marca_id'] = this.marcaId;
    data['marca'] = this.marca;
    data['productoModelo_id'] = this.productoModeloId;
    data['modelo_id'] = this.modeloId;
    data['modelo'] = this.modelo;
    data['nombre_imagen'] = this.nombreImagen;
    data['url'] = this.url;
    data['categoriaProducto_id'] = this.categoriaProductoId;
    data['categoria'] = this.categoria;
    data['tipo_telefono_id'] = this.tipoTelefonoId;
    data['tipo_telefono'] = this.tipoTelefono;
    data['precio_factura'] = this.precioFactura;
    data['precio_minimo'] = this.precioMinimo;
    data['precio_maximo'] = this.precioMaximo;
    data['precioMayorista'] = this.precioMayorista;
    data['precioSubdistribuidor'] = this.precioSubdistribuidor;
    data['precioConsignacion'] = this.precioConsignacion;
    data['color'] = this.color;
    data['hexadecimal'] = this.hexadecimal;
    data['tipoMovimientoInventario_id'] = this.tipoMovimientoInventarioId;
    data['tipo_movimiento'] = this.tipoMovimiento;
    data['cantidad'] = this.cantidad;
    data['fecha'] = this.fecha;
    data['personal_origen'] = this.personalOrigen;
    return data;
  }
}
