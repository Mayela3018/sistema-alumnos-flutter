import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/alumno.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class ListarAlumnosPage extends StatefulWidget {
  const ListarAlumnosPage({super.key});

  @override
  State<ListarAlumnosPage> createState() => _ListarAlumnosPageState();
}

class _ListarAlumnosPageState extends State<ListarAlumnosPage> {
  String _busqueda = '';

  @override
  Widget build(BuildContext context) {
    final filtrados = alumnosGlobal
        .where((a) =>
            a.nombreCompleto.toLowerCase().contains(_busqueda.toLowerCase()) ||
            a.codigo.toLowerCase().contains(_busqueda.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Alumnos')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (v) => setState(() => _busqueda = v),
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o código...',
                prefixIcon: const Icon(Icons.search, color: kColor3),
                suffixIcon: _busqueda.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: kColor3),
                        onPressed: () => setState(() => _busqueda = ''))
                    : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [kColor3, kColor4]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('${filtrados.length} alumno(s)',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 60, color: kColor4.withOpacity(0.5)),
                        const SizedBox(height: 8),
                        Text('No se encontraron alumnos',
                            style: TextStyle(color: kColor3.withOpacity(0.7))),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: filtrados.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (ctx, i) {
                      final a = filtrados[i];
                      return Container(
                        decoration: BoxDecoration(
                          color: kCard,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: kColor3.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 3)),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundColor: kColor4.withOpacity(0.2),
                            child: Text(a.nombre[0].toUpperCase(),
                                style: const TextStyle(
                                    color: kColor2, fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          title: Text(a.nombreCompleto,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14, color: kColor1)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(a.carrera,
                                  style: TextStyle(fontSize: 12, color: kColor3.withOpacity(0.8))),
                              const SizedBox(height: 2),
                              Row(children: [
                                Icon(Icons.badge_outlined, size: 12, color: kColor4.withOpacity(0.7)),
                                const SizedBox(width: 4),
                                Text(a.codigo,
                                    style: TextStyle(fontSize: 11, color: kColor4.withOpacity(0.8))),
                              ]),
                            ],
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [kColor3, kColor4]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('Ciclo ${a.ciclo}',
                                style: const TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11)),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}