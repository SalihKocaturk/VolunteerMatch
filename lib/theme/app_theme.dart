// import 'package:flutter/material.dart';

// class AppTheme {
//   static const Color seed = Color(0xFF5CB58A);
//   static const Color beige = Color(0xFFF5E9DA);
//   static const Color forest = Color(0xFF2F6E5E);

//   static ThemeData light() {
//     final base = ThemeData(
//       colorSchemeSeed: seed,
//       brightness: Brightness.light,
//       useMaterial3: true,
//     );

//     return base.copyWith(
//       scaffoldBackgroundColor: beige,
//       textTheme: base.textTheme.apply(
//         bodyColor: const Color(0xFF24323C),
//         displayColor: const Color(0xFF24323C),
//       ),
//       appBarTheme: const AppBarTheme(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black87,
//         centerTitle: true,
//       ),
//       filledButtonTheme: FilledButtonThemeData(
//         style: FilledButton.styleFrom(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14),
//           ),
//         ),
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//           // ignore: deprecated_member_use
//           side: BorderSide(color: forest.withOpacity(.25), width: 1.2),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14),
//           ),
//         ),
//       ),
//     );
//   }

//   static ThemeData dark() {
//     final base = ThemeData(
//       colorSchemeSeed: seed,
//       brightness: Brightness.dark,
//       useMaterial3: true,
//     );

//     return base.copyWith(
//       scaffoldBackgroundColor: const Color(0xFF111418),
//       appBarTheme: const AppBarTheme(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.white,
//         centerTitle: true,
//       ),
//     );
//   }
// }
