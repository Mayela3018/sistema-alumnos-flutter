import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Perfil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kColor1, kColor2, kColor3],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kColor5, width: 3),
                    ),
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundColor: kColor4,
                      child: Icon(Icons.person, size: 52, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text('Administrador General',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('admin@instituto.edu.pe',
                      style: TextStyle(
                          color: kColor5.withOpacity(0.85), fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _InfoCard(items: const [
              _InfoItem(icon: Icons.badge,         label: 'Nombre',       value: 'Admin Sistema'),
              _InfoItem(icon: Icons.email,          label: 'Correo',       value: 'admin@instituto.edu.pe'),
              _InfoItem(icon: Icons.phone,          label: 'Teléfono',     value: '+51 999 888 777'),
              _InfoItem(icon: Icons.work,           label: 'Rol',          value: 'Administrador'),
              _InfoItem(icon: Icons.calendar_today, label: 'Activo desde', value: 'Enero 2024'),
            ]),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<_InfoItem> items;
  const _InfoCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: kColor3.withOpacity(0.12),
              blurRadius: 14,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: items.map((item) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: kColor4.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(item.icon, color: kColor3, size: 18),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.label,
                            style: TextStyle(
                                fontSize: 11, color: kColor4.withOpacity(0.8))),
                        Text(item.value,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kColor1)),
                      ],
                    ),
                  ],
                ),
              ),
              if (items.last != item)
                Divider(height: 1, indent: 20, color: kColor5.withOpacity(0.4)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  const _InfoItem({required this.icon, required this.label, required this.value});
}