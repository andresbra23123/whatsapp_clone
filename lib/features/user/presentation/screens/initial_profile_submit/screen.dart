import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_auth/user_auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/initial_profile_submit/components/body_initial_profile_submit_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/initial_profile_submit/cubit/initial_profile_cubit.dart';

class InitialProfileSubmitScreen extends StatefulWidget {
  const InitialProfileSubmitScreen({super.key});

  @override
  State<InitialProfileSubmitScreen> createState() =>
      _InitialProfileSubmitScreenState();
}

class _InitialProfileSubmitScreenState
    extends State<InitialProfileSubmitScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthCubit, UserAuthState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => InitialProfileCubit(
            userEntity: (state as UserAuthAuthenticated).user,
          ),
          child: Scaffold(
            floatingActionButton: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
              ),
              tooltip: 'More options',
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
            body: const BodyInitialProfileComponent(),
          ),
        );
      },
    );
  }
}
