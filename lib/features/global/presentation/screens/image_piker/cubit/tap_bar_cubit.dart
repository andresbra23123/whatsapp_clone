import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class TapBarCubit extends Cubit<List<AssetPathEntity>> {
  TapBarCubit({required this.tickerProvider}) : super([]) {
    _init();
  }
  final TickerProvider tickerProvider;
  TabController? tabController;

  Future<void> _init() async {
    final hasPermission = await checkStoragePermission();
    if (!hasPermission) {
      await PhotoManager.openSetting();
    }
    final filteredAlbums = await PhotoManager.getAssetPathList(
      type: RequestType.image,
    );
    final albums = filteredAlbums.where((album) {
      return album.id == 'isAll' ||
          album.id == '540528482' ||
          album.id == '-1739773001';
    }).toList();

    emit(albums);

    tabController = TabController(
      length: albums.length,
      vsync: tickerProvider,
    );
  }

  Future<bool> checkStoragePermission() async {
    final rpe = await PhotoManager.requestPermissionExtend();
    return rpe == PermissionState.limited || rpe == PermissionState.authorized;
  }

  @override
  Future<void> close() {
    tabController?.dispose();
    return super.close();
  }
}
