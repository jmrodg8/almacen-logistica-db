--jmrodg8

DROP DATABASE IF EXISTS almacen_logistica; 
CREATE DATABASE almacen_logistica 
    CHARACTER SET utf8mb4 
    COLLATE utf8mb4_unicode_ci; 

USE almacen_logistica;

-- TABLAS MAESTRAS (Independientes)

CREATE TABLE categorias (
    categoria_id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255),
    
    CONSTRAINT pk_categorias PRIMARY KEY (categoria_id),
    CONSTRAINT uq_categorias_nombre UNIQUE (nombre)
);

CREATE TABLE proveedores (
    proveedor_id INT UNSIGNED AUTO_INCREMENT,
    razon_social VARCHAR(255) NOT NULL,
    contacto_nombre VARCHAR(255),
    email VARCHAR(255),
    telefono VARCHAR(15),
    direccion TEXT,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_proveedores PRIMARY KEY (proveedor_id),
    CONSTRAINT uq_proveedores_email UNIQUE (email)
);

CREATE TABLE clientes ( 
    cliente_id INT UNSIGNED AUTO_INCREMENT, 
    nombre VARCHAR(255) NOT NULL, 
    email VARCHAR(255) NOT NULL, 
    telefono VARCHAR(15),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP, 
        
    CONSTRAINT pk_clientes PRIMARY KEY (cliente_id), 
    CONSTRAINT uq_clientes_email UNIQUE (email)
);

-- TABLAS RELACIONALES (Dependientes)

CREATE TABLE productos (
    producto_id INT UNSIGNED AUTO_INCREMENT,
    categoria_id INT UNSIGNED NOT NULL, 
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    stock_actual INT UNSIGNED DEFAULT 0, 
    stock_minimo INT UNSIGNED DEFAULT 0, 
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_productos PRIMARY KEY (producto_id),
    CONSTRAINT uq_productos_nombre UNIQUE (nombre),
    CONSTRAINT fk_productos_categorias FOREIGN KEY (categoria_id)
        REFERENCES categorias (categoria_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE pedidos (
    pedido_id INT UNSIGNED AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL, 
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP, 
    estado ENUM('Pendiente', 'Procesado', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'Pendiente',
    total_pedido DECIMAL(12, 2) DEFAULT 0.00,

    CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id),
    CONSTRAINT fk_pedidos_clientes FOREIGN KEY (cliente_id)
        REFERENCES clientes (cliente_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE detalle_pedidos (
    pedido_id INT UNSIGNED NOT NULL,   
    producto_id INT UNSIGNED NOT NULL, 
    cantidad INT UNSIGNED NOT NULL, 
    precio_unitario_historico DECIMAL(10, 2) NOT NULL, 

    CONSTRAINT pk_detalle_pedidos PRIMARY KEY (pedido_id, producto_id),
    CONSTRAINT fk_detalle_pedidos_pedidos FOREIGN KEY (pedido_id) 
        REFERENCES pedidos (pedido_id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detalle_pedidos_productos FOREIGN KEY (producto_id)
        REFERENCES productos (producto_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE historial_inventario (
    movimiento_id INT UNSIGNED AUTO_INCREMENT,
    producto_id INT UNSIGNED NOT NULL, 
    proveedor_id INT UNSIGNED NULL, 
    tipo_movimiento ENUM('Entrada', 'Salida', 'Ajuste_Positivo', 'Ajuste_Negativo') NOT NULL,
    cantidad INT UNSIGNED NOT NULL, 
    fecha_movimiento DATETIME DEFAULT CURRENT_TIMESTAMP, 
    motivo TEXT,

    CONSTRAINT pk_historial_inventario PRIMARY KEY (movimiento_id),
    CONSTRAINT fk_historial_productos FOREIGN KEY (producto_id) 
        REFERENCES productos (producto_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_historial_proveedores FOREIGN KEY (proveedor_id) 
        REFERENCES proveedores (proveedor_id) ON DELETE RESTRICT ON UPDATE CASCADE
);
