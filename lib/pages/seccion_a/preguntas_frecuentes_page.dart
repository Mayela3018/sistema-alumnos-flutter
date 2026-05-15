import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class PreguntasFrecuentesPage extends StatefulWidget {
  const PreguntasFrecuentesPage({super.key});

  @override
  State<PreguntasFrecuentesPage> createState() => _PreguntasFrecuentesPageState();
}

class _PreguntasFrecuentesPageState extends State<PreguntasFrecuentesPage> {
  final List<Map<String, String>> _faqs = [
    {'q': '¿Cómo registro un nuevo alumno?',
     'a': 'Ve al menú y selecciona "Registrar Alumno". Completa nombre, apellido, código, carrera y ciclo, luego presiona GUARDAR.'},
    {'q': '¿Cómo busco un alumno en la lista?',
     'a': 'Ingresa a "Listar Alumnos". Usa la barra de búsqueda para filtrar por nombre o código en tiempo real.'},
    {'q': '¿Puedo editar los datos de un alumno?',
     'a': 'En esta versión la edición no está habilitada. Se agregará próximamente.'},
    {'q': '¿Qué hago si olvidé mi contraseña?',
     'a': 'Contacta al administrador en soporte@instituto.edu.pe para restablecer tu acceso.'},
    {'q': '¿Los datos se guardan de forma permanente?',
     'a': 'Esta versión no usa base de datos. Los datos se mantienen durante la sesión pero se pierden al cerrar la app.'},
    {'q': '¿Cómo cerrar sesión correctamente?',
     'a': 'Desde el menú principal presiona "Cerrar Sesión" y confirma en el diálogo.'},
  ];

  final Set<int> _abiertos = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preguntas Frecuentes')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [kColor2, kColor3, kColor4],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: kColor5.withOpacity(0.25), shape: BoxShape.circle),
                  child: const Icon(Icons.help_outline, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Centro de Ayuda',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('Encuentra respuestas rápidas aquí',
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ..._faqs.asMap().entries.map((entry) {
            final i = entry.key;
            final faq = entry.value;
            final abierto = _abiertos.contains(i);
            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: abierto ? kColor4 : Colors.transparent, width: 1.5),
                boxShadow: [BoxShadow(color: kColor3.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 2))],
              ),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: abierto ? kColor4.withOpacity(0.25) : kColor5.withOpacity(0.3),
                  child: Text('${i + 1}',
                      style: TextStyle(
                          color: abierto ? kColor2 : kColor3,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                ),
                title: Text(faq['q']!,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: abierto ? kColor2 : kColor1)),
                iconColor: kColor4,
                collapsedIconColor: kColor3,
                onExpansionChanged: (v) =>
                    setState(() => v ? _abiertos.add(i) : _abiertos.remove(i)),
                children: [
                  Divider(color: kColor5.withOpacity(0.5)),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.check_circle_outline, color: kColor4, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(faq['a']!,
                            style: TextStyle(
                                color: kColor2.withOpacity(0.85), fontSize: 13, height: 1.5)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}