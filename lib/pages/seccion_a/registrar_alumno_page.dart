import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alumno.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/widgets/custom_field.dart';

class RegistrarAlumnoPage extends StatefulWidget {
  const RegistrarAlumnoPage({super.key});

  @override
  State<RegistrarAlumnoPage> createState() => _RegistrarAlumnoPageState();
}

class _RegistrarAlumnoPageState extends State<RegistrarAlumnoPage> {
  final _nombreCtrl   = TextEditingController();
  final _apellidoCtrl = TextEditingController();
  final _codigoCtrl   = TextEditingController();
  String _carrera = 'Ing. de Sistemas';
  String _ciclo   = '1';

  final List<String> _carreras = ['Ing. de Sistemas', 'Administración', 'Contabilidad', 'Marketing', 'Derecho'];
  final List<String> _ciclos   = ['1','2','3','4','5','6','7','8','9','10'];

  void _guardar() {
    if (_nombreCtrl.text.isEmpty || _apellidoCtrl.text.isEmpty || _codigoCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Completa todos los campos'), backgroundColor: kColor2));
      return;
    }
    alumnosGlobal.add(Alumno(
      nombre:   _nombreCtrl.text.trim(),
      apellido: _apellidoCtrl.text.trim(),
      codigo:   _codigoCtrl.text.trim(),
      carrera:  _carrera,
      ciclo:    _ciclo,
    ));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Alumno "${_nombreCtrl.text.trim()}" registrado ✔'),
      backgroundColor: kColor3,
    ));
    _nombreCtrl.clear();
    _apellidoCtrl.clear();
    _codigoCtrl.clear();
    setState(() { _carrera = 'Ing. de Sistemas'; _ciclo = '1'; });
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _apellidoCtrl.dispose();
    _codigoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Alumno')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kColor4.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kColor4.withOpacity(0.4)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: kColor3),
                  const SizedBox(width: 10),
                  Expanded(child: Text('Completa los datos del nuevo estudiante.',
                      style: TextStyle(color: kColor2, fontSize: 13))),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: kColor3.withOpacity(0.1), blurRadius: 14, offset: const Offset(0, 4))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomField(label: 'Nombre',           icon: Icons.person_outline, controller: _nombreCtrl),
                  const SizedBox(height: 16),
                  CustomField(label: 'Apellido',         icon: Icons.person,         controller: _apellidoCtrl),
                  const SizedBox(height: 16),
                  CustomField(label: 'Código de Alumno', icon: Icons.badge_outlined,  controller: _codigoCtrl),
                  const SizedBox(height: 16),
                  Text('Carrera', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: kColor2)),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    value: _carrera,
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.school_outlined, color: kColor3, size: 20)),
                    items: _carreras.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                    onChanged: (v) => setState(() => _carrera = v!),
                  ),
                  const SizedBox(height: 16),
                  Text('Ciclo', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: kColor2)),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    value: _ciclo,
                    decoration: const InputDecoration(prefixIcon: Icon(Icons.format_list_numbered, color: kColor3, size: 20)),
                    items: _ciclos.map((c) => DropdownMenuItem(value: c, child: Text('Ciclo $c'))).toList(),
                    onChanged: (v) => setState(() => _ciclo = v!),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [kColor2, kColor3]),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text('GUARDAR ALUMNO',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                      onPressed: _guardar,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}