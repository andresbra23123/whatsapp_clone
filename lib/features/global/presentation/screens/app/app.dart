import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/dependency_injection.dart';
import 'package:whatsapp_clone/features/global/presentation/cubit/cubits.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_auth/user_auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_managemen/user_management_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<PreferencesCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<StorageCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<UserAuthCubit>()..getCurrentUser(),
        ),
        BlocProvider(
          create: (context) => sl<UserManagementCubit>(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final preferencesCubit = context.watch<PreferencesCubit>().state;

    return MaterialApp.router(
      theme: AppTheme(isDarkmode: preferencesCubit.isDarkMode).getTheme(),
      title: 'Whatasapp Clone',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(preferencesCubit.languageCode),
      routerConfig: appRouter,
    );
  }
}
