# Proyecto_movil_el_dorado.


Repositorio del Ciclo 4  Diplomado en desarrollo Movil MinTIC 2022



## Descripción del Proyecto
El contenido de este repositorio corresponde a la creación del aplicativo Movil  EL Dorado por el equipo de trabajo D-M El Dorado en el marco del Diplomado en desarrollo de Software MinTic 2022.


El proyecto consiste en  el desarrolo de 
 
Este aplicativo web tiene como objetivo el desarrollo de una aplicación móvil enfocada en turismo. La aplicación debe ten

Sistema de Login. Permite registrarse e iniciar sesión en la aplicación.
Lista de sitios turísticos. Permite visualizar un listado de sitios turísticos del municipio o ciudad seleccionado.
Detalle del sitio turístico. Al seleccionar uno de los sitios del listado se abre el detalle del sitio con información más detallada del mismo y la posibilidad de visualizarlo en un mapa.
Sitios Favoritos. Sección en el que se visualizan los sitios turísticos favoritos que el usuario ha decidido almacenar en su dispositivo. 

## Desarrolladores
- `Scrum Master`: Fernando Velez Carmona.
- `Desarrolladora `: Sergio Andrés Hidalgo Flórez.
- `Analista`: Santiago Enriquez Benavides.
- `Product Owner`: Jheinner elias castellar.
- `Administrador del Servidor`: Juan David Alvarez Palau.

## Fases
- `Sprint 1`: Conformación del equipo de trabajo y nombramiento de roles.
              Creacion de un repositorio en Github con permisos de lectura/escritura del repositorio para sus integrantes
              Crear un espacio de trabajo en Jira, para administrar el proyecto con permisos de lectura/escritura del repositorio para sus integrantes
              
- `Sprint 2`: La aplicación debe tener una pantalla de Login y una de registro
              El registro e inicio de sesión se debe hacer con correo electrónico y contraseña
              Solo se debe crear la interfaz y navegar entre ella
              Se debe visualizar la siguiente información: nombre o título, información general, ubicación, temperatura, etc.
              La información esta quemada en la aplicación, no se consume ni se almacena de ninguna API.
              
- `Sprint 3`: Utilizar Firebase Auth para el sistema de login de la aplicación
              Utilizar Firebase Cloud Firestore para almacenar los datos del usuario
              La aplicación debe leer la información de una base de datos creada en Cloud Firestore
              Se debe visualizar una lista de lugares turísticos, con la siguiente información: foto, nombre del lugar, pequeña descripción y puntuación.
              Al dar clic en un item de la lista se debe abrir el detalle del POI y visualizar la información correspondiente.
              La aplicación debe navegar entre el sistema de login, la lista de POI y el detalle
              Verificar de forma manual que no se presenten fallas en la aplicación

- `Sprint 4`: La ubicación debe lanzar un intent que permita visualizar el lugar en el mapa de Google Maps o algún otro mapa OpenSource.
              Verificar de forma manual que no se presenten fallas en la aplicación
              El almacenamiento de los sitios favoritos se debe hacer de forma local con Hive
              Se debe poder navegar a los favoritos y encontrar la lista de los mismos.
              Verificar de forma manual que no se presenten fallas en la aplicación

## Tecnologias
- DART
- FLUTTER
- FIREBASE 
- HIVE 
- GOOGLE MAPS

