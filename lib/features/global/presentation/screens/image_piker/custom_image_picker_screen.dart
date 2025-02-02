import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/global/presentation/screens/image_piker/components/tap_bar_compoenent.dart';
import 'package:whatsapp_clone/features/global/presentation/screens/image_piker/components/tap_bar_view_componenet.dart';
import 'package:whatsapp_clone/features/global/presentation/screens/image_piker/cubit/tap_bar_cubit.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TapBarCubit(tickerProvider: this),
      child: const Scaffold(
        appBar: AppBarComponenet(),
        body: TapBarViewComponenet(),
      ),
    );
  }
}
