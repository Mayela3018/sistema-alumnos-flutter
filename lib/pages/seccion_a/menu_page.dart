import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/pages/seccion_a/login_page.dart';
import 'package:flutter_application_1/pages/seccion_a/perfil_page.dart';
import 'package:flutter_application_1/pages/seccion_a/registrar_alumno_page.dart';
import 'package:flutter_application_1/pages/seccion_a/listar_alumnos_page.dart';
import 'package:flutter_application_1/pages/seccion_a/preguntas_frecuentes_page.dart';

class MenuOpcion {
  final IconData icon;
  final String label;
  final String sub;
  final Color color;
  final Widget page;

  const MenuOpcion({
    required this.icon,
    required this.label,
    required this.sub,
    required this.color,
    required this.page,
  });
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MenuOpcion> opciones = [
      MenuOpcion(icon: Icons.person,          label: 'Perfil',               sub: 'Ver mi información',    color: kColor2, page: const PerfilPage()),
      MenuOpcion(icon: Icons.person_add_alt_1, label: 'Registrar Alumno',    sub: 'Agregar estudiante',    color: kColor3, page: const RegistrarAlumnoPage()),
      MenuOpcion(icon: Icons.people_alt,       label: 'Listar Alumnos',      sub: 'Ver todos los alumnos', color: kColor4, page: const ListarAlumnosPage()),
      MenuOpcion(icon: Icons.quiz_outlined,    label: 'Preguntas Frecuentes', sub: 'Dudas comunes',        color: kColor5, page: const PreguntasFrecuentesPage()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _confirmarCierre(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner bienvenida
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kColor1, kColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: kColor1.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: kColor4.withOpacity(0.25),
                      shape: BoxShape.circle,
                      border: Border.all(color: kColor5.withOpacity(0.4)),
                    ),
                    child: const Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('¡Bienvenido!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text('Administrador del sistema',
                          style: TextStyle(
                              color: kColor5.withOpacity(0.85), fontSize: 13)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('¿Qué deseas hacer?',
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600, color: kColor2)),
            const SizedBox(height: 12),

            // Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.05,
                ),
                itemCount: opciones.length,
                itemBuilder: (BuildContext ctx, int i) {
                  return CardMenu(opcion: opciones[i]);
                },
              ),
            ),

            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.logout, color: kColor3),
                label: const Text('Cerrar Sesión',
                    style: TextStyle(color: kColor3)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: kColor3),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => _confirmarCierre(context),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _confirmarCierre(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.logout, color: kColor3),
            SizedBox(width: 8),
            Text('Cerrar Sesión', style: TextStyle(color: kColor1)),
          ],
        ),
        content: const Text('¿Estás seguro que deseas salir?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: kColor2)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kColor3),
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
              (_) => false,
            ),
            child: const Text('Salir'),
          ),
        ],
      ),
    );
  }
}

class CardMenu extends StatelessWidget {
  final MenuOpcion opcion;
  const CardMenu({super.key, required this.opcion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => opcion.page)),
      child: Container(
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: opcion.color.withOpacity(0.18),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: opcion.color.withOpacity(0.12),
                shape: BoxShape.circle,
                border: Border.all(
                    color: opcion.color.withOpacity(0.3), width: 1.5),
              ),
              child: Icon(opcion.icon, color: opcion.color, size: 28),
            ),
            const SizedBox(height: 10),
            Text(opcion.label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 13, color: kColor1)),
            const SizedBox(height: 4),
            Text(opcion.sub,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11, color: kColor3.withOpacity(0.7))),
          ],
        ),
      ),
    );
  }
}