class Estudiante {
  var codigo;
  var nombre;
  var apellido;
  var telefono;

  Estudiante({
    this.codigo,
    this.nombre,
    this.apellido,
    this.telefono,
  });
}

List<Estudiante> estudiantes = [
  Estudiante(
      codigo: '001', nombre: 'Luis', apellido: 'Gomez', telefono: '3015276487'),
  Estudiante(
      codigo: '002',
      nombre: 'Eduardo',
      apellido: 'Santiago',
      telefono: '3015276487'),
  Estudiante(
      codigo: '003', nombre: 'Pepe', apellido: 'Pipa', telefono: '3015276487'),
  Estudiante(
      codigo: '004', nombre: 'Cj', apellido: 'Cj', telefono: '3015276487'),
];
