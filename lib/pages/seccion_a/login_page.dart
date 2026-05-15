import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/widgets/custom_field.dart';
import 'package:flutter_application_1/pages/seccion_a/menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _ingresar() {
    if (_userCtrl.text.isEmpty || _passCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Completa usuario y contraseña'),
          backgroundColor: kColor2,
        ),
      );
      return;
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MenuPage()),
    );
  }

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kColor1, kColor2, kColor3],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: kColor4.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: kColor5.withOpacity(0.5), width: 2),
                    ),
                    child: const Icon(Icons.school, size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Sistema de Alumnos',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Ingresa tus credenciales para continuar',
                    style: TextStyle(color: kColor5.withOpacity(0.9), fontSize: 13),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: kColor1.withOpacity(0.25),
                          blurRadius: 24,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 28, height: 3,
                                decoration: BoxDecoration(
                                    color: kColor4,
                                    borderRadius: BorderRadius.circular(2))),
                            const SizedBox(width: 10),
                            const Text('Iniciar Sesión',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: kColor1)),
                            const SizedBox(width: 10),
                            Container(
                                width: 28, height: 3,
                                decoration: BoxDecoration(
                                    color: kColor4,
                                    borderRadius: BorderRadius.circular(2))),
                          ],
                        ),
                        const SizedBox(height: 28),
                        CustomField(
                            label: 'Usuario',
                            icon: Icons.person_outline,
                            controller: _userCtrl),
                        const SizedBox(height: 16),
                        CustomField(
                            label: 'Contraseña',
                            icon: Icons.lock_outline,
                            controller: _passCtrl,
                            obscure: true),
                        const SizedBox(height: 28),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [kColor2, kColor3]),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: _ingresar,
                            child: const Text('INGRESAR',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('v1.0.0 — Instituto Educativo',
                      style: TextStyle(
                          color: kColor5.withOpacity(0.6), fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}