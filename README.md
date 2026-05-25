# Sistema de Gestión de Almacén y Logística 📦

Este repositorio contiene el diseño e implementación de la base de datos para un sistema de gestión de almacén, inventario y logística. El proyecto está estructurado para modelar de forma eficiente el flujo de productos desde los proveedores hasta el control de stock y la venta final a los clientes.

## 🚀 Características del Proyecto

* **Estructura Relacional Sólida:** Integridad referencial implementada mediante claves foráneas con políticas de borrado (`RESTRICT`/`CASCADE`) y actualización (`CASCADE`).
* **Historial de Inventario:** Registro detallado de movimientos (Entradas, Salidas y Ajustes) para mantener la trazabilidad del stock.
* **Control de Pedidos:** Flujo de ventas estructurado con estados dinámicos (`Pendiente`, `Procesado`, `Enviado`, etc.) e histórico de precios para evitar la pérdida de datos financieros por inflación o cambios de tarifa.
* **Optimización de Datos:** Uso del juego de caracteres `utf8mb4_unicode_ci` para un soporte completo de caracteres internacionales y emojis.

---

## 🗺️ Modelo Entidad-Relación (E-R)

El diseño de la base de datos se divide en dos grandes bloques para garantizar la consistencia de los datos:

1.  **Tablas Maestras (Independientes):** `categorias`, `proveedores` y `clientes`.
2.  **Tablas Relacionales (Dependientes):** `productos`, `pedidos`, `detalle_pedidos` y `historial_inventario`.

*Para ver la representación gráfica del modelo, puedes consultar el archivo adjunto en la raíz del repositorio:* **`Entidad-Relación (E-R).png`**.
![Diagrama Entidad-Relación](./Entidad-Relación%20\(E-R\).png)

---

## 📁 Estructura del Repositorio

```text
├── Entidad-Relación (E-R).png  # Diagrama visual de la base de datos
├── README.md                   # Documentación del proyecto (este archivo)
└── schema.sql                  # Script SQL de creación de la base de datos y tablas
````
