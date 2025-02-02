import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_clone/features/global/presentation/screens/image_piker/cubit/tap_bar_cubit.dart';
import 'package:whatsapp_clone/features/global/presentation/screens/image_piker/cubit/tap_bar_view_cubit.dart';

class TapBarViewComponenet extends StatelessWidget {
  const TapBarViewComponenet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tapBarCubit = context.watch<TapBarCubit>();

    if (tapBarCubit.tabController != null) {
      return TabBarView(
        controller: tapBarCubit.tabController,
        children: _buildTabsViews(tapBarCubit.state),
      );
    }
    return Container();
  }

  List<Widget> _buildTabsViews(List<AssetPathEntity> albums) {
    return albums
        .map(
          (album) => BlocProvider(
            create: (context) => TapBarViewCubit(album: album),
            child: const TabContentWidget(),
          ),
        )
        .toList();
  }
}

class TabContentWidget extends StatefulWidget {
  const TabContentWidget({super.key});

  @override
  State<TabContentWidget> createState() => _TabContentWidgetState();
}

class _TabContentWidgetState extends State<TabContentWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  @override
  void initState() {
    super.initState();
    final tapBarViewProvider = context.read<TapBarViewCubit>();

    tapBarViewProvider.scrollController
        .addListener(tapBarViewProvider.scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Necesario para AutomaticKeepAliveClientMixin

    return BlocBuilder<TapBarViewCubit, TapBarViewState>(
      builder: (context, state) {
        if (state.uint8List.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        final tapBarViewCubit = context.watch<TapBarViewCubit>();

        return GridView.builder(
          controller: tapBarViewCubit.scrollController,
          itemCount: state.uint8List.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            final uint8ListValue = state.uint8List[index];
            return _Images(
              uint8ListValue: uint8ListValue,
              onTap: () async {
                final rrr = await tapBarViewCubit.uint8ListToFile(
                  uint8ListValue!,
                );
                context.pop<File>(rrr);
              },
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _Images extends StatelessWidget {
  const _Images({this.uint8ListValue, this.onTap});
  final Uint8List? uint8ListValue;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (uint8ListValue == null) return const Center(child: Icon(Icons.error));

    return GestureDetector(
      onTap: onTap,
      child: GridTile(
        child: Image.memory(
          uint8ListValue!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
