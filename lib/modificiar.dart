import 'package:ejemplo3/modelos.dart';
import 'package:flutter/material.dart';

class modificar extends StatefulWidget {
  final Estudiante estudiante;

  modificar(this.estudiante, {Key? key}) : super(key: key);

  @override
  State<modificar> createState() => _modificarState();
}

class _modificarState extends State<modificar> {
  Estudiante estudiante = new Estudiante();

  late TextEditingController controladorCodigo;
  late TextEditingController controladorNombre;
  late TextEditingController controladorApellido;
  late TextEditingController controladorTelefono;

  @override
  void initState() {
    Estudiante e = widget.estudiante;

    controladorCodigo = TextEditingController(text: e.codigo);
    controladorNombre = TextEditingController(text: e.nombre);
    controladorApellido = TextEditingController(text: e.apellido);
    controladorTelefono = TextEditingController(text: e.telefono);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorCodigo,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Codigo',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorCodigo.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorNombre,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Nombre',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorNombre.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorApellido,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Apellido',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorApellido.clear();
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: TextField(
            controller: controladorTelefono,
            decoration: InputDecoration(
                filled: true,
                labelText: 'Telefono',
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controladorTelefono.clear();
                  },
                )),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              estudiante = new Estudiante(
                codigo: controladorCodigo.text,
                nombre: controladorNombre.text,
                apellido: controladorApellido.text,
                telefono: controladorTelefono.text,
              );
              Navigator.pop(context, estudiante);
            },
            child: Text('Guardar Estudiante'))
      ]),
    );
    ;
  }
}
