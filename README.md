<div align="center">

<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
<img src="https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white"/>

<br/>
<br/>

# 🎓 Sistema de Gestión de Alumnos
### Aplicación móvil desarrollada con Flutter

*Laboratorio de Desarrollo de Aplicaciones Móviles*

[![GitHub](https://img.shields.io/badge/Repositorio-Mayela3018-A786C6?style=flat-square&logo=github)](https://github.com/Mayela3018/sistema-alumnos-flutter)
![Estado](https://img.shields.io/badge/Estado-Completado-0C273C?style=flat-square)
![Versión](https://img.shields.io/badge/Versión-1.0.0-686293?style=flat-square)

</div>

---

## 📱 Vista General

Sistema de gestión de alumnos desarrollado en **Flutter** con diseño profesional, navegación entre múltiples pantallas y arquitectura de carpetas organizada. La aplicación **no requiere base de datos** — los datos se almacenan en memoria durante la sesión.

---

## ✨ Pantallas

| Pantalla | Descripción |
|---|---|
| 🔐 **Login** | Pantalla de inicio con degradado y validación de campos |
| 🏠 **Menú Principal** | Grid de opciones con tarjetas y banner de bienvenida |
| 👤 **Perfil** | Información del administrador con tarjeta visual |
| ➕ **Registrar Alumno** | Formulario con dropdowns de carrera y ciclo |
| 📋 **Listar Alumnos** | ListView con búsqueda en tiempo real |
| ❓ **Preguntas Frecuentes** | Acordeón interactivo con ExpansionTile |

---

## 🗂️ Estructura de Carpetas

```
lib/
├── main.dart                          ← Punto de entrada de la app
│
├── theme/
│   └── app_theme.dart                 ← Paleta de colores y tema global
│
├── models/
│   └── alumno.dart                    ← Clase Alumno + lista en memoria
│
├── widgets/
│   └── custom_field.dart              ← Widget reutilizable de formulario
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

---

## 🎨 Paleta de Colores

<div align="center">

| Constante | Color | Hex | Uso |
|---|---|---|---|
| `kColor1` | 🟦 | `#0C273C` | AppBar, títulos, fondo degradado |
| `kColor2` | 🔵 | `#324161` | Subtítulos, etiquetas |
| `kColor3` | 🟣 | `#686293` | Íconos, botones, bordes activos |
| `kColor4` | 💜 | `#A786C6` | Highlights, badges, círculos |
| `kColor5` | 🌸 | `#E2A8E2` | Bordes suaves, chips, divisores |

</div>

---

## 🚀 Funciones Nuevas Aplicadas

### 1. 📁 Arquitectura de Carpetas *(Tema nuevo — no visto en clase)*
Organización del proyecto en carpetas temáticas dentro de `lib/`. Cada carpeta tiene una responsabilidad única, facilitando el mantenimiento y escalabilidad del proyecto.

### 2. 📦 Imports por Nombre de Paquete
```dart
// ✅ Correcto — evita errores al reorganizar archivos
import 'package:flutter_application_1/theme/app_theme.dart';
```

### 3. 🎨 ThemeData Centralizado
Un solo archivo `app_theme.dart` controla todos los colores y estilos. Cambiar un color se aplica automáticamente en toda la app.

### 4. 🧩 Widget Reutilizable (CustomField)
```dart
CustomField(
  label: 'Nombre',
  icon: Icons.person_outline,
  controller: _nombreCtrl,
)
```

### 5. 🔍 ListView con Búsqueda en Tiempo Real
Filtrado dinámico de alumnos usando `setState()` + `.where()` mientras el usuario escribe.

### 6. 🪗 ExpansionTile para FAQ
Acordeón interactivo nativo de Flutter con estado controlado mediante `Set<int>`.

---

## 🛠️ Tecnologías Usadas

- **Flutter** — Framework de desarrollo móvil
- **Dart** — Lenguaje de programación
- **Material Design 3** — Sistema de diseño de Google
- **Navigator** — Sistema de navegación entre pantallas
- **StatefulWidget / setState** — Gestión de estado local

---

## ▶️ Cómo Ejecutar

```bash
# 1. Clonar el repositorio
git clone https://github.com/Mayela3018/sistema-alumnos-flutter.git

# 2. Entrar a la carpeta
cd sistema-alumnos-flutter

# 3. Instalar dependencias
flutter pub get

# 4. Ejecutar la app
flutter run -d chrome
```

---

## 📂 Navegación de la App

```
Login
  └── Menú Principal
        ├── Perfil
        ├── Registrar Alumno
        ├── Listar Alumnos
        └── Preguntas Frecuentes
              └── Cerrar Sesión → Login
```

---

## 👩‍💻 Autora

<div align="center">

**Mayela**
Estudiante de Desarrollo de Aplicaciones Móviles

[![GitHub](https://img.shields.io/badge/GitHub-Mayela3018-0C273C?style=for-the-badge&logo=github)](https://github.com/Mayela3018)

</div>

---

<div align="center">

*Desarrollado con ❤️ usando Flutter*

</div>
