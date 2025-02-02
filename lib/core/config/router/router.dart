import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/features/global/presentation/cubit/cubits.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/funtions.dart';
import 'package:whatsapp_clone/features/global/presentation/screens/screens.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_auth/user_auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/initial_profile_submit/screen.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/screen.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      pageBuilder: (context, state) => navigationAnimation(
        context: context,
        page: const SplashScreen(),
        tipeAnimation: TipeAnimation.fade,
      ),
    ),
    GoRoute(
      path: '/welcome',
      name: 'welcome',
      pageBuilder: (context, state) => navigationAnimation(
        context: context,
        page: const WelcomePage(),
        tipeAnimation: TipeAnimation.slide,
      ),
    ),
    GoRoute(
      path: '/phoneVerification',
      name: 'phoneVerification',
      pageBuilder: (context, state) => navigationAnimation(
        context: context,
        page: const PhoneAuthScreen(),
        tipeAnimation: TipeAnimation.slide,
      ),
    ),
    GoRoute(
      path: '/phoneCodeVerification',
      name: 'phoneCodeVerification',
      pageBuilder: (context, state) {
        final args = state.extra as Map<String, String>?; // Leer argumentos
        final phoneNumber = args?['phoneNumber'] ?? 'Unknown';
        return navigationAnimation(
          context: context,
          page: PhoneCodeVerificationScreen(
            phoneNumber: phoneNumber,
          ),
          tipeAnimation: TipeAnimation.slide,
        );
      },
    ),
    GoRoute(
      path: '/initialProfileSubmitScreen',
      name: 'initialProfileSubmitScreen',
      pageBuilder: (context, state) {
        return navigationAnimation(
          context: context,
          page: const InitialProfileSubmitScreen(),
          tipeAnimation: TipeAnimation.slide,
        );
      },
    ),
    GoRoute(
      path: '/imagePickerScreen',
      name: 'imagePickerScreen',
      pageBuilder: (context, state) {
        return navigationAnimation(
          context: context,
          page: const ImagePickerScreen(),
          tipeAnimation: TipeAnimation.slide,
        );
      },
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      pageBuilder: (context, state) {
        return navigationAnimation(
          context: context,
          page: Scaffold(
            body: SafeArea(
              child: TextButton(
                onPressed: () async {
                  final userAuthCubit = context.read<UserAuthCubit>();
                  final preferencesCubit = context.read<PreferencesCubit>();

                  await userAuthCubit.signOut();
                  await preferencesCubit
                      .onTogglePassedInitialProfileSubmitScreen();
                  context.go('/welcome');
                },
                child: const Text('Sign Out'),
              ),
            ),
          ),
          tipeAnimation: TipeAnimation.slide,
        );
      },
    ),
  ],
  redirect: (context, state) {
    final aserAuthCubit = context.read<UserAuthCubit>();
    final preferencesCubit = context.read<PreferencesCubit>();
    final userAuthState = aserAuthCubit.state is UserAuthAuthenticated;
    // Rutas relacionadas con el proceso de autenticación

    final authRoutes = [
      '/welcome',
      '/phoneVerification',
      '/phoneCodeVerification',
    ];

    // Rutas permitidas durante el flujo de inicialización del perfil
    final initialProfileRoutes = [
      '/initialProfileSubmitScreen',
      '/imagePickerScreen',
    ];

    // Asegurarnos de que el SplashScreen sea visible antes de aplicar la lógica
    if (state.matchedLocation == '/splash') {
      return null; // No redirigir mientras se carga el SplashScreen
    }

    // Si no está autenticado y está en una ruta de autenticación, permitir que pase
    if (!userAuthState && authRoutes.contains(state.matchedLocation)) {
      return null; // No redirigir, dejar que el usuario pase por las pantallas de autenticación
    }

    // Si no está autenticado y está intentando ir a cualquier otra parte que no sea el flujo de autenticación, redirigir a /welcome
    if (!userAuthState && !authRoutes.contains(state.matchedLocation)) {
      return '/welcome'; // Si no está autenticado, llevarlo a la pantalla de bienvenida
    }

    // Si está autenticado pero no ha completado el perfil inicial
    if (userAuthState &&
        !preferencesCubit.state.hasPassedInitialProfileSubmitScreen &&
        !initialProfileRoutes.contains(state.matchedLocation)) {
      return '/initialProfileSubmitScreen';
    }

    // Si el usuario está autenticado y está en una ruta de autenticación, redirigir a /home
    if (userAuthState && authRoutes.contains(state.matchedLocation)) {
      return '/home'; // Usuario autenticado no debe estar en proceso de autenticación
    }

    return null; // Sin redirección adicional
  },
);
