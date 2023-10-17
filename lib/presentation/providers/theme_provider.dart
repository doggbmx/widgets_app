// Estado => bool isDarkModeProvider

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// un simple booleano
final themeProvider = StateProvider<bool>((ref) => false);

// un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Listado de colores inmutables
final colorListProvider = Provider(((ref) => colorList));
