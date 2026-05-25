# 📦 Sistema de Gestión de Almacén y Logística

<div align="center">

![MySQL](https://img.shields.io/badge/MySQL-8.0+-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Active-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

**Base de datos relacional para gestión integral de almacén, inventario y logística.**

"Una base de datos rápida y organizada que evita errores y guarda el historial completo de un almacén."
[Modelo E-R](https://github.com/jmrodg8/almacen-logistica-db/tree/main#%EF%B8%8F-modelo-entidad-relaci%C3%B3n) •
[Instalación](#-instalación) 

</div>

---

## 🗺️ Modelo Entidad-Relación

![Diagrama Entidad-Relación](./Entidad-Relación%20\(E-R\).png)

---

## 🚀 Instalación

### Requisitos

- MySQL 8.0+ o MariaDB 10.5+
- Cliente MySQL o herramienta GUI (MySQL Workbench, DBeaver, etc.)

### Opción 1: Línea de comandos

```bash
# Clonar el repositorio
git clone https://github.com/jmrodg8/almacen-logistica-db.git
cd almacen-logistica-db

# Crear la base de datos
mysql -u root -p < schema.sql

# (Opcional) Cargar datos de ejemplo
mysql -u root -p almacen_logistica < seed.sql
```

### Opción 2: MySQL Workbench

1. Abrir `schema.sql` en MySQL Workbench
2. Ejecutar el script completo (⚡ icono o `Ctrl+Shift+Enter`)
3. Verificar que las tablas se crearon correctamente

---

## 📄 Licencia

Este proyecto está bajo la licencia [MIT](./LICENSE).

---

<div align="center">

**Desarrollado con ❤️ por [jmrodg8](https://github.com/jmrodg8)**

</div>
