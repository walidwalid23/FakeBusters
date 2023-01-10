import 'package:fakebustersapp/presentation/controller/theme_events.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemesState
, AsyncValue<String>>((ref) => ThemesState());