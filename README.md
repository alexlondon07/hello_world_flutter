# Flutter

## Que es flutter<a name="what_is_flutter"></a>

flutter es un framework portable de Google para construir interfaces modernas, nativas y aplicaciones reactivas para ios y android. Es posible utilizar flutter para el desarrollo web. Flutter es open source y su proyecto se encuentra hosteado en github con las contribuciones de google y de la comunidad que decide aportar al proyecto.

[Repositorio Flutter][repo_flutter]


## Novedades de flutter<a name="news_flutter"></a>

* Flutter usa el SKIA2D como motor de render, lo que le permite trabajar con una amplia variedad de plataformas.

* Utiliza como lenguaje Dart

* Flutter es rápido, y tiene la capacidad de renderizar a 60 fps por segundo incluso a 120 dependiendo del dispositivo, lo que permite tener animaciones elegantes.

* Los desarrollos hechos usando flutter terminan con un rendimiento nativo para los dispositivos iOS y Android.

* Cuenta con ``Hot Reload`` lo  que facilita el desarrollo de las aplicaciones, esto lo logra gracias a la compilación ``Just in time`` que tiene por el hecho de utilizar la maquina virtual de Dart.

## Comparativa Flutter vs React Native <a name="flutter_vs_react_native"></a>

La ventaja que tiene flutter o al menos el factor diferenciador es el hecho de que a diferencia de herramientas como React native este no hace uso de un puente para comunicarse con las APIS  específicas de iOS y Android.


## Widgets 

Flutter basa su desarrollo en el uso de widgets que son análogos a piezas de lego. Cuando estos "legos" trabajan juntos son capaces de crear las interfaces de flutter haciendo uso del "Widget Tree".

A gran rasgo podemos resumir los widgets de la siguiente manera:

* Widgets con elementos estructurados como `` list, grid, text,`` and ``button``.

* Widgets con input elements como `` form, form fields`` and ``keyboard listeners``.

* Widgets con estilos como `` font type, size, weight, color, border`` y ``sombras``.

* Widgets para estructurar la interfaz de usuario como ``row, column, stack, centering``, y ``padding``

* Widgets  con elementos interactivos  que responden al tacto, gestos, etc.


Importante tener en cuenta que nosotros tambien tenemos la capacidad de crear nuestros propios widgets.

### Entendiendo el ciclo de vida de un widget 

En la programación, se manejan diferentes ciclos de vida que usualmente ocurren de manera lineal, uno después del otro a medida que se completa uno. En flutter básicamente se manejan dos tipos de widgets los ``StatelessWidget`` y ``StatefulWidget``, generalmente utilizamos los StatelessWidget para ser usado cuando los valores(estado) no cambian y un StatefulWidget es utilizado cuando los valores(estado) cambian.

### Ciclo de vida StatelessWidget

![stateless_widget](/assets/images/stateless_widget.jpg)

Es un artefacto basado en una configuración y que no cambia dinámicamente. básicamente es un componente con una descripcion que no cambiara, este es declarado utilizando una clase.


``` dart
class myStatelessWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Text('Using Stateless Widget');
    }  
}
```

### Ciclo de vida StatefulWidget

Este tipo de Widget es utilizado cuando la data cambia, es decir este tipo de widget puede cambiar con el tiempo, por lo que se hace necesario el manejar dos clases. 

![stateful_widget](/assets/images/stateful_widget.png)

``` dart
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Hello flutter'),
          ),
          body: Center(
            child: Text('Hello world from StatefullWidget'),
          ),
        ));
  }
}
```

Es importante tener en cuenta que para propagar un cambio en la interfaz es necesario utilizar el metodo ``setState()``. En resumen podemos identificar 3 elementos de los ``StatefulWidget``:

* ``StatefulWidget:`` Es la clase que crea una instancia del estado

* ``State:`` Es la clase encargada de ser la que lee sicronicamente cuando  el widget es construido y puede cambiar en el tiempo.

* ``setState()`` Es el método encargado de refrescar la data, este le dice al framework cuando debe reconstruir un widget porque el estado cambio, ninguna variable puede ser modificada fuera de este método, por lo que si no se encuentra implementada correctamente  no cambiará la UI. Hay que tener en cuenta que es preferible tener cálculos o lógicas fuera de este método si no se quiere realizar ningún cambio en el estado.

Consideremos un ejemplo sencillo para mostrar una oferta, la cual incrementara cuando se clickee en el botón, para esto es necesario crear una clase que se extienda de StatefulWidget  y tambien es necesario crear un estado para dicha clase, el codigo para representar lo anterior seria: 

``` dart
class MaximumOffer extends StatefulWidget {
  @override
  _MaximumOffer createState() => _MaximumOffer();
}

class _MaximumOffer extends State<MaximumOffer> {
  double _MaxOffer = 0.0;

  void _increaseMyMaxOffer() {
    setState(() {
      _MaxOffer += 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('My Maximum Offer: $_MaxOffer'),
        FlatButton.icon(
            onPressed: () => _increaseMyMaxOffer(),
            icon: Icon(Icons.add_circle),
            label: Text('Increase Offer'))
      ],
    );
  }
}
```

En el anterior código observamos que se crea una clase ``MaximumOffer`` la cual se extiende de StatefulWidget, tambien vemos que creamos una clase ``_MaximumOffer`` la cual se encargara de guardar el estado de la aplicación, dentro de esta clase se aprecia que estamos utilizando el método ``setState()``, que como habíamos mencionado anteriormente es necesario para poder refrescar la ui dependiendo de un cambio en el estado.


## Usando paquetes Externos 

Algunas veces no es bueno construir un widget desde cero, Flutter cuenta con soporte de librerías de terceros provenientes de los ecosistemas de Dart y Flutter, Se puede decir basado en esto que existen dos tipos de paquetes:

* ``Dart Packages`

Son escritos en Dart y pueden contener dependencias especificas para flutter.

* ``Plugin Packages``

Tambien son escritos con Dart pero estos tienen la particularidad de que son combinados con código especifico de de una plataforma sea iOS y/o Android, generalmente estos plugins soportan ambas plataformas.

### Buscando paquetes

1. Ir a la pagina [pub.dev][plugins_flutter]

2. Buscar el paquete que se ajuste a nuestras necesidades, la herramienta cuenta con la capacidad de filtrar por plataforma si es necesario para un requerimiento en especifico de la app.

3. Como ejemplo utilizaremos el paquete  [shared_preferences][shared_preferences]

4. Clickeamos en el apartado de ``installing`` en la cual encontraremos las instrucciones para instalar el paquete deseado.

### Instalando paquetes

1. Dentro del proyecto buscamos el archivo ``pubspec.yaml``, este archivo es utilizado para manejar las dependencias de nuestro proyecto.

2. Abrimos el archivo y dentro de la sección de ``dependencies``, agregamos lo siguiente según el paquete de ejemplo:

``` yaml
dependencies:
  shared_preferences: ^0.5.7+3
```

Este automáticamente traerá la dependencia seleccionada, si no lo hace puedes ejecutar el comando ``flutter packages get``.

El archivo lucirá de la siguiente manera:

![pubspec-yaml](/assets/images/pubspec.png)

3. Para utilizar el paquete simplemente lo importamos en donde se quiere usar, en este caso se importará dentro de ``main.dart``, ubicando el import luego del paquete ``material.dart``

``` dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
``` 

## Creando un proyecto base

Teniendo en cuenta que el proyecto es creado de manera ágil por la herramienta que estemos usando hablaremos unicamente de una estructura posterior a la creación del proyecto, por ende estos serián los pasos a seguir:

1. Crear la siguiente estructura de carpetas utilizando:

``` shell
mkdir -p assets/images;
mkdir -p lib/pages;
mkdir -p lib/models;
mkdir -p lib/utils;
mkdir -p lib/widgets;
mkdir -p lib/services
```

Observamos como debería quedar el proyecto luego de crear las carpetas necesarias:

![folder_structure](/assets/images/folder_structure.png)

* ``assets/images`` : Es la carpeta donde almacenaremos nuestros recursos estáticos como las imágenes o las fuentes.
* ``lib/pages`` : Se utiliza para manejar las interfaces(UI) del proyecto.
* ``lib/models``: Contiene las clases de los datos, como información del cliente y artículos de almacén.
* ``lib/utils``: Maneja las clases encargadas de ayudar en la lógica como los cálculos de la fecha o la conversion de data
* ``lib/widgets``: Contiene todos los widgets separados en archivos para ser reusados.
* ``lib/services``: Este será el fólder que contendrá los servicios encargados de pedir la data a servicios externos o expuestos en internet.

[repo_flutter]:https://github.com/flutter/flutter
[plugins_flutter]:https://pub.dartlang.org/flutter
[shared_preferences]:https://pub.dartlang.org/flutter
