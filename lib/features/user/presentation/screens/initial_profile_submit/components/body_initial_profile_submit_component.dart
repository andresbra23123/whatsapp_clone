import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/global/presentation/cubit/cubits.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/initial_profile_submit/components/user_image_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/initial_profile_submit/cubit/initial_profile_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/widgets/widgets.dart';

class BodyInitialProfileComponent extends StatefulWidget {
  const BodyInitialProfileComponent({super.key});

  @override
  State<BodyInitialProfileComponent> createState() =>
      _BodyInitialProfileComponentState();
}

class _BodyInitialProfileComponentState
    extends State<BodyInitialProfileComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                InformationComponent(),
                UserImageCompoenent(),
                TextInputComponen(),
                SizedBox(height: 10),
              ],
            ),
            ContinueButtomWidget(
              text: 'Next',
              onPressed: () async {
                final preferencesCubit = context.read<PreferencesCubit>();
                await preferencesCubit
                    .onTogglePassedInitialProfileSubmitScreen();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TextInputComponen extends StatelessWidget {
  const TextInputComponen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: CustomTextField(
        hintText: 'Type your name here',
        maxLength: 25,
        textAlign: TextAlign.justify,
        onChanged: (value) {
          final initialProfileCubit = context.read<InitialProfileCubit>();

          // initialProfileCubit.updateDisplayName(value);
        },
        // onTap: buildShowCountryPicker,
      ),
    );
  }
}

class InformationComponent extends StatelessWidget {
  const InformationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Profile info',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Please provide your name and optional profile photo',
          style: TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
