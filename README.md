<div align="center">

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
<img src="https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white"/>

<br/><br/>

# 🎓 Sistema de Gestión de Alumnos
### Aplicación móvil desarrollada con Flutter

*Laboratorio de Desarrollo de Aplicaciones Móviles*

[![GitHub](https://img.shields.io/badge/Repositorio-Mayela3018-401D5A?style=flat-square&logo=github&logoColor=white)](https://github.com/Mayela3018/sistema-alumnos-flutter)
![Estado](https://img.shields.io/badge/Estado-Completado✓-746ABE?style=flat-square)
![Versión](https://img.shields.io/badge/Versión-1.0.0-A682C8?style=flat-square)
![Sin BD](https://img.shields.io/badge/Base%20de%20datos-Sin%20BD%20(memoria)-EA93EA?style=flat-square)

</div>

---

## 📖 Descripción

Sistema de gestión de alumnos desarrollado en **Flutter** como laboratorio de desarrollo de aplicaciones móviles. Implementa navegación entre múltiples pantallas, arquitectura de carpetas organizada y diseño visual profesional con paleta de colores personalizada.

> ⚠️ **Sin base de datos** — Los datos se almacenan en una lista global en memoria durante la sesión.

---

## 📱 Pantallas

| # | Pantalla | Descripción |
|---|---|---|
| 1 | 🔐 **Login** | Inicio de sesión con degradado y validación de campos |
| 2 | 🏠 **Menú Principal** | Grid 2×2 de opciones con banner de bienvenida |
| 3 | 👤 **Perfil** | Información del administrador con tarjeta visual |
| 4 | ➕ **Registrar Alumno** | Formulario con dropdowns de carrera (5 opciones) y ciclo (1-10) |
| 5 | 📋 **Listar Alumnos** | ListView con búsqueda en tiempo real por nombre o código |
| 6 | ❓ **Preguntas Frecuentes** | Acordeón interactivo con 6 preguntas y respuestas |

---

## 🗂️ Estructura de Carpetas *(Tema nuevo — no visto en clase)*

```
lib/
├── main.dart                               ← Punto de entrada de la app
│
├── theme/
│   └── app_theme.dart                      ← Paleta de colores y ThemeData global
│
├── models/
│   └── alumno.dart                         ← Clase Alumno + lista global en memoria
│
├── widgets/
│   └── custom_field.dart                   ← Widget reutilizable de formulario
│
└── pages/
    └── seccion_a/
        ├── login_page.dart
        ├── menu_page.dart
        ├── perfil_page.dart
        ├── registrar_alumno_page.dart
        ├── listar_alumnos_page.dart
        └── preguntas_frecuentes_page.dart
```

Cada carpeta tiene **una sola responsabilidad**:
- `models/` → define las clases de datos
- `theme/` → centraliza todos los colores y estilos
- `widgets/` → componentes reutilizables en varias pantallas
- `pages/` → agrupa las pantallas por sección

---

## 🎨 Paleta de Colores

Todos los colores se definen en `lib/theme/app_theme.dart` usando `Color.fromARGB()`:

```dart
const kColor1 = Color.fromARGB(255, 64,  29,  90);   // Morado oscuro  → AppBar, títulos
const kColor2 = Color.fromARGB(255, 85,  65,  198);  // Azul morado    → Subtítulos, etiquetas
const kColor3 = Color.fromARGB(255, 116, 106, 190);  // Lila medio     → Íconos, botones
const kColor4 = Color.fromARGB(255, 166, 130, 200);  // Lila claro     → Highlights, badges
const kColor5 = Color.fromARGB(255, 234, 147, 234);  // Rosa lila      → Bordes suaves
const kBg     = Color(0xFFF3EEF8);                   // Fondo general
const kCard   = Colors.white;                         // Fondo tarjetas
```

> ✅ Cambiar un color en este archivo lo actualiza automáticamente en **toda la app**.

---

## 🚀 Funciones Nuevas Aplicadas

### 1. 📁 Arquitectura de Carpetas *(no vista en clase)*
Organización del proyecto en carpetas temáticas dentro de `lib/`. Cada carpeta agrupa archivos con la misma responsabilidad, haciendo el proyecto mantenible y escalable.

---

### 2. 📦 Imports por Nombre de Paquete
En lugar de rutas relativas que se rompen al mover archivos, se usó el nombre del paquete en todos los imports:

```dart
// ✅ Usado en el proyecto
import 'package:flutter_application_1/theme/app_theme.dart';
import 'package:flutter_application_1/models/alumno.dart';
import 'package:flutter_application_1/widgets/custom_field.dart';
```

---

### 3. 🎨 ThemeData Centralizado (AppTheme)

```dart
class AppTheme {
  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: kColor3,
      primary: kColor1,
      secondary: kColor4,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: kBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: kColor1,
      foregroundColor: Colors.white,
    ),
    // ... estilos de botones e inputs
  );
}
```

---

### 4. 🧩 Widget Reutilizable (CustomField)
Se encapsuló etiqueta + TextField en un widget propio para no repetir código:

```dart
class CustomField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final bool obscure;

  const CustomField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.obscure = false,
  });
  // ...
}

// Uso en cualquier pantalla:
CustomField(label: 'Nombre', icon: Icons.person_outline, controller: _nombreCtrl)
```

---

### 5. 🔍 ListView con Búsqueda en Tiempo Real

```dart
// TextField que actualiza el filtro mientras el usuario escribe
onChanged: (v) => setState(() => _busqueda = v),

// Lista filtrada dinámicamente con .where()
final filtrados = alumnosGlobal
    .where((a) =>
        a.nombreCompleto.toLowerCase().contains(_busqueda.toLowerCase()) ||
        a.codigo.toLowerCase().contains(_busqueda.toLowerCase()))
    .toList();
```

---

### 6. 🪗 ExpansionTile con Estado Controlado

```dart
final Set<int> _abiertos = {};

ExpansionTile(
  iconColor: kColor4,
  collapsedIconColor: kColor3,
  onExpansionChanged: (v) =>
      setState(() => v ? _abiertos.add(i) : _abiertos.remove(i)),
  // Cambia colores y bordes según si está abierto o no
  leading: CircleAvatar(
    backgroundColor: abierto ? kColor4.withOpacity(0.25) : kColor5.withOpacity(0.3),
  ),
)
```

---

## 📊 Modelo de Datos

```dart
class Alumno {
  final String nombre;
  final String apellido;
  final String codigo;
  final String carrera;
  final String ciclo;

  Alumno({
    required this.nombre,
    required this.apellido,
    required this.codigo,
    required this.carrera,
    required this.ciclo,
  });

  String get nombreCompleto => '$nombre $apellido';
}

// Lista global en memoria (sin base de datos)
final List<Alumno> alumnosGlobal = [
  Alumno(nombre: 'Ana',   apellido: 'García',  codigo: 'A001', carrera: 'Ing. de Sistemas', ciclo: '5'),
  Alumno(nombre: 'Luis',  apellido: 'Pérez',   codigo: 'A002', carrera: 'Administración',   ciclo: '3'),
  Alumno(nombre: 'María', apellido: 'Torres',  codigo: 'A003', carrera: 'Contabilidad',     ciclo: '7'),
];
```

---

## 🛠️ Tecnologías

| Tecnología | Uso |
|---|---|
| **Flutter** | Framework principal de desarrollo |
| **Dart** | Lenguaje de programación |
| **Material Design 3** | Sistema de diseño (`useMaterial3: true`) |
| **Navigator** | Navegación entre pantallas con push/pop |
| **StatefulWidget + setState** | Gestión de estado local |
| **Color.fromARGB** | Definición de colores personalizados |

---

## ▶️ Cómo Ejecutar

```bash
# 1. Clonar el repositorio
git clone https://github.com/Mayela3018/sistema-alumnos-flutter.git

# 2. Entrar a la carpeta
cd sistema-alumnos-flutter

# 3. Instalar dependencias
flutter pub get

# 4. Ejecutar
flutter run -d chrome      # En navegador
flutter run -d windows     # En escritorio Windows
```

---

## 🔄 Flujo de Navegación

```
┌─────────┐
│  Login  │
└────┬────┘
     │ Navigator.pushReplacement
     ▼
┌──────────────────┐
│  Menú Principal  │◄──── Cerrar Sesión (pushAndRemoveUntil)
└──┬───┬───┬───┬───┘
   │   │   │   │  Navigator.push
   ▼   ▼   ▼   ▼
Perfil Reg Lista FAQ
```

---

## 👩‍💻 Autora

<div align="center">

**Mayela**
Estudiante de Desarrollo de Aplicaciones Móviles

[![GitHub](https://img.shields.io/badge/GitHub-Mayela3018-401D5A?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Mayela3018/sistema-alumnos-flutter)

*Desarrollado con 💜 usando Flutter*

</div>
