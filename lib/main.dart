import 'package:ejemplo3/adicionar.dart';
import 'package:ejemplo3/modelos.dart';
import 'package:flutter/material.dart';

import 'modificiar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Estudiantes(),
    );
  }
}

class Estudiantes extends StatefulWidget {
  Estudiantes({Key? key}) : super(key: key);

  @override
  State<Estudiantes> createState() => _Estudiantes();
}

class _Estudiantes extends State<Estudiantes> {
  List _listaEstudiantes = estudiantes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Estudiantes'),
      ),
      body: ListView.builder(
          itemCount: _listaEstudiantes.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => modificar(_listaEstudiantes[index]),
                    )).then((resultado) {
                  _listaEstudiantes.removeAt(index);
                  _listaEstudiantes.insert(index, resultado);

                  setState(() {});
                });
              },
              onLongPress: () {
                _eliminarestudiante(context, _listaEstudiantes[index]);
              },
              title: Text(_listaEstudiantes[index].nombre +
                  ' ' +
                  _listaEstudiantes[index].apellido),
              subtitle: Text('Codigo: ' + _listaEstudiantes[index].codigo),
              leading: CircleAvatar(
                child: Text(_listaEstudiantes[index].nombre.substring(0, 1) +
                    _listaEstudiantes[index].apellido.substring(0, 1)),
              ),
              trailing: Icon(Icons.check),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdicionarEstudiante(),
              )).then((resultado) {
            _listaEstudiantes.addAll(resultado);

            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _eliminarestudiante(context, Estudiante estudiante) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Eliminar Estudiante'),
              content: Text('Esta Seguro de Eliminar a: ' + estudiante.nombre),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this._listaEstudiantes.remove(estudiante);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}
