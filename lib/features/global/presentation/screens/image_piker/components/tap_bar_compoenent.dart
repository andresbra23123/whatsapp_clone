import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/screens/image_piker/cubit/tap_bar_cubit.dart';

class AppBarComponenet extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponenet({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final tapBarCubit = context.watch<TapBarCubit>();
    if (tapBarCubit.tabController != null) {
      return AppBar(
        backgroundColor: AppThemeColors.appBarColor,
        bottom: TabBar(
          labelColor: AppThemeColors.greenColorOne,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: AppThemeColors.greenColorOne,
          controller: tapBarCubit.tabController,
          tabs: _buildTabs(tapBarCubit.state),
        ),
      );
    }
    return AppBar(
      backgroundColor: AppThemeColors.appBarColor,
    );
  }

  List<Widget> _buildTabs(List<AssetPathEntity> albums) {
    return albums.map((album) => Tab(text: album.name)).toList();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48.0);
}
