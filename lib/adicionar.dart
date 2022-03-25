import 'package:ejemplo3/modelos.dart';
import 'package:flutter/material.dart';

class AdicionarEstudiante extends StatefulWidget {
  AdicionarEstudiante({Key? key}) : super(key: key);

  @override
  State<AdicionarEstudiante> createState() => _AdicionarEstudianteState();
}

class _AdicionarEstudianteState extends State<AdicionarEstudiante> {
  List<Estudiante> _estudiantesadd = [];

  late TextEditingController controladorCodigo;
  late TextEditingController controladorNombre;
  late TextEditingController controladorApellido;
  late TextEditingController controladorTelefono;

  @override
  void initState() {
    controladorCodigo = TextEditingController();
    controladorNombre = TextEditingController();
    controladorApellido = TextEditingController();
    controladorTelefono = TextEditingController();
  }

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
              _estudiantesadd.add(Estudiante(
                codigo: controladorCodigo.text,
                nombre: controladorNombre.text,
                apellido: controladorApellido.text,
                telefono: controladorTelefono.text,
              ));
              Navigator.pop(context, _estudiantesadd);
            },
            child: Text('Guardar Estudiante'))
      ]),
    );
  }
}
