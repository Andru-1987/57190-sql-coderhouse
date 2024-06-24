## CREACION BASE DE UNA APP PARA RESERVAS UN RESTAURANT USANDO DISTINTOS


### Problema:

Nuestro equipo de desarrollo está trabajando en un sistema de gestión de reservas para restaurantes, y nos enfrentamos a la necesidad de diseñar una base de datos eficiente que pueda manejar todas las operaciones relacionadas con las reservas de manera óptima.

### Descripción del Problema:

1. **Gestión de Clientes y Empleados**: Necesitamos una base de datos que nos permita registrar la información de los clientes que realizan reservas, así como de los empleados involucrados en el proceso de reserva, como los camareros o encargados de atención al cliente.

2. **Gestión de Tipos de Reserva**: Es importante poder clasificar las reservas según su tipo, ya sea una reserva estándar, una reserva para eventos especiales o reservas de grupos grandes. Esto nos ayudará a organizar mejor el flujo de trabajo y adaptar nuestros servicios según las necesidades del cliente.

3. **Gestión de Mesas y Disponibilidad**: La base de datos debe permitirnos registrar la disponibilidad de mesas en cada restaurante, así como gestionar su capacidad y estado (ocupado o disponible). Esto es fundamental para garantizar una asignación eficiente de mesas y evitar conflictos de reservas.

4. **Registro de Reservas**: Necesitamos un sistema que pueda registrar de manera detallada cada reserva realizada, incluyendo la fecha y hora de la reserva, el cliente que la realizó, la mesa reservada, el empleado que atendió la reserva y el tipo de reserva.

### Objetivo:

Diseñar e implementar una base de datos relacional que satisfaga todas las necesidades de gestión de reservas para nuestro sistema de gestión de restaurantes. Esta base de datos deberá ser eficiente, escalable y fácil de mantener, permitiendo una gestión ágil y precisa de todas las operaciones relacionadas con las reservas.


## Descripción de la Base de Datos - Gestión de Reservas en Restaurantes

Esta base de datos está diseñada para gestionar reservas en restaurantes, así como la información relacionada con clientes, empleados, tipos de reserva y restaurantes mismos. A continuación se detallan los elementos principales de la base de datos:

### Tablas:

1. **CLIENTE**:
   - Almacena información sobre los clientes que realizan reservas.
   - Atributos: IDCLIENTE, NOMBRE, TELEFONO, CORREO.

2. **EMPLEADO**:
   - Contiene información sobre los empleados involucrados en el proceso de reservas.
   - Atributos: IDEMPLEADO, NOMBRE, TELEFONO, CORREO, IDRESTAURANTE.

3. **DUEÑO**:
   - Guarda datos sobre los dueños de los restaurantes (no se utiliza explícitamente en el proceso de reservas).

4. **TIPORESERVA**:
   - Define diferentes tipos de reserva para clasificarlas según su propósito o requisitos específicos.
   - Atributos: IDTIPORESERVA, TIPO.

5. **RESTAURANTE**:
   - Almacena información sobre los restaurantes disponibles.
   - Atributos: IDRESTAURANTE, NOMBRE, DIRECCION, TELEFONO.

6. **MESA**:
   - Contiene información sobre las mesas disponibles en cada restaurante.
   - Atributos: IDMESA, IDRESTAURANTE, CAPACIDAD, DISPONIBLE.

7. **RESERVA**:
   - Registra las reservas realizadas por los clientes.
   - Atributos: IDRESERVA, IDCLIENTE, IDMESA, IDEMPLEADO, IDTIPORESERVA, FECHA.

### Problemática Resuelta:

Esta base de datos permite gestionar eficientemente el proceso de reserva en restaurantes, desde la información de los clientes y empleados hasta la disponibilidad de mesas y el registro de reservas. Algunos aspectos que aborda incluyen:

- Registro de clientes y empleados involucrados en el proceso de reserva.
- Clasificación de las reservas según su tipo.
- Gestión de la disponibilidad de mesas en cada restaurante.
- Registro detallado de las reservas realizadas, incluyendo la fecha, cliente, mesa, empleado y tipo de reserva.

En resumen, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de reserva en restaurantes, lo que contribuye a mejorar el servicio ofrecido a los clientes y optimizar las operaciones del restaurante.
*/

### MEDIOS DE RESERVAS


#### DER SIMPLIFICADO
```
+------------------+        +-----------------------+        +------------------+
|      CLIENTE     |        |       RESERVA         |        |     RESTAURANTE  |
+------------------+        +-----------------------+        +------------------+
| idCliente (PK)   |<>-----o| idReserva (PK)        |o-------| idRestaurante(PK)|
| nombre           |        | idCliente (FK)        |        | nombre           |
| telefono         |        | idMesa (FK)           |        | direccion        |
| correo           |        | idEmpleado (FK)       |        | telefono         |
+------------------+        | idTipoReserva (FK)    |        +------------------+
                            | fecha                 |
                            | cancelacion           |                  |
                            +-----------------------+                  |
                                    |                                  |
                                    |                                  |
                                    v                                  v
+------------------+        +------------------+             +-------------------+
|     Empleado     |        |      Mesa        |             |     Dueno         |
+------------------+        +------------------+             +-------------------+
| idEmpleado (PK)  |        | idMesa (PK)      |             | idDueno (PK)      |
| nombre           |        | idRestaurante(FK)|             | nombre            |
| telefono         |        | capacidad        |             | correo            |
| correo           |        | disponible       |             | telefono          |
| idRestaurante(FK)|        +------------------+             +-------------------+
+------------------+                  |
                             +-------------------+
                             |   TipoReserva     |
                             +-------------------+
                             | idTipoReserva(PK) |
                             | tipo              |
                             +-------------------+
``