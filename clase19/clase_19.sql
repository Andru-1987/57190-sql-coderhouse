-- DCL 

-- LINKS DE AYUDA: 
   -- https://www.atlassian.com/data/admin/how-to-grant-all-privileges-on-a-database-in-mysql
   -- https://www.atlassian.com/data/admin/grant-permissions-for-mysql  (PERMISOS UN POCO MAS AVANZADOS)
   

## Manejo de usuarios y roles en MySQL:

**Creación de usuarios:**

```sql
CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña';
```

**Ejemplo:**

```sql
CREATE USER 'juan'@'localhost' IDENTIFIED BY 'clave123';
```

**Creación de permisos:**

```sql
GRANT <permisos> ON <base_de_datos>.<tabla> TO 'nombre_usuario'@'localhost';
```

**Ejemplo:**

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON escuela.alumno TO 'juan'@'localhost';
```

**Modificación de permisos:**

```sql
GRANT <permisos> ON <base_de_datos>.<tabla> TO 'nombre_usuario'@'localhost' WITH GRANT OPTION;
```

**Ejemplo:**

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON escuela.alumno TO 'juan'@'localhost' WITH GRANT OPTION;
```

**Borrado de permisos:**

```sql
REVOKE <permisos> ON <base_de_datos>.<tabla> FROM 'nombre_usuario'@'localhost';
```

**Ejemplo:**

```sql
REVOKE SELECT, INSERT, UPDATE, DELETE ON escuela.alumno FROM 'juan'@'localhost';
```

**Revocado de permisos:**

```sql
REVOKE ALL PRIVILEGES ON *.* FROM 'nombre_usuario'@'localhost';
```

**Ejemplo:**

```sql
REVOKE ALL PRIVILEGES ON *.* FROM 'juan'@'localhost';
```

```sql
-- permisos absolutos admin
GRANT ALL PRIVILEGES ON *.* TO 'adriana'@'%' WITH GRANT OPTION;
```


**Actualizacion de privilegios**

```
-- sql
FLUSH PRIVILEGES;
```

**Creación de roles:**

```sql
CREATE ROLE 'nombre_rol';
```

**Ejemplo:**

```sql
CREATE ROLE 'administrador';
```

**Asignación de permisos en roles:**

```sql
GRANT <permisos> ON <base_de_datos>.<tabla> TO 'nombre_rol';
```

**Ejemplo:**

```sql
GRANT SELECT, INSERT, UPDATE, DELETE ON escuela.alumno TO 'administrador';
```

**Asignación de roles:**

```sql
GRANT 'nombre_rol' TO 'nombre_usuario'@'localhost';
```

**Ejemplo:**

```sql
GRANT 'administrador' TO 'juan'@'localhost';
```

-- ACTIVIDAD EN CLASE :
✔ Crea un usuario llamado coderhouse y asígnale lo mismo como contraseña.
✔ Establece permisos de solo lectura de datos sobre la tabla GAME.
✔ Establece permisos de lectura e inserción sobre la tabla CLASS.
✔ Abre una nueva ventana de conexión e inicia sesión con este usuario.
✔ Modifica un registro cualquiera de la tabla GAME y aplica los cambios.
✔ Agrega un registro en la tabla CLASS.
✔ Elimina este último registro agregado.



CREATE USER 'coderhouse'@'localhost' IDENTIFIED BY 'coderhouse';
GRANT SELECT ON escuela.GAME TO 'coderhouse'@'localhost';
GRANT SELECT, INSERT ON escuela.CLASS TO 'coderhouse'@'localhost';


-- EXTRA 

-- PROCEDURE LEVEL
CREATE PROCEDURE get_student_names(IN student_id INT)
BEGIN
  SELECT nombre, apellido
  FROM alumno
  WHERE id_alumno = student_id;
END;

GRANT EXECUTE ON PROCEDURE escuela.get_student_names TO 'user1'@'localhost';


-- FUNCTION LEVEL
CREATE FUNCTION get_passing_grades(grades VARCHAR(255))
RETURNS INT
BEGIN
  DECLARE passing_grade INT;
  SET passing_grade = (SELECT nota_final FROM alumno WHERE nota_final >= 7);
  RETURN passing_grade;
END;

GRANT EXECUTE ON FUNCTION escuela.get_passing_grades TO 'user2'@'localhost';

SELECT nombre, apellido, get_passing_grades(nota_final) AS passing_grade
FROM alumno;



CREATE VIEW student_list AS
SELECT nombre, apellido, nivel
FROM alumno;

GRANT SELECT ON escuela.student_list TO 'user3'@'localhost';
