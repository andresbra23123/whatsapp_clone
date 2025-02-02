import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:uuid/uuid.dart';

part 'tap_bar_view_state.dart';

class TapBarViewCubit extends Cubit<TapBarViewState> {
  TapBarViewCubit({required this.album}) : super(const TapBarViewState()) {
    _fetchAssetsFromPath();
  }
  final AssetPathEntity album;
  ScrollController scrollController = ScrollController();

  final int _sizeValue = 20;

  Future<void> _fetchAssetsFromPath() async {
    if (state.isLoadin) return;
    emit(state.copyWith(isLoadin: true));
    final assetEntities = await album.getAssetListPaged(
      page: state.currentPage,
      size: _sizeValue,
    );
    for (final assetEntity in assetEntities) {
      final uint8Listvalue = await assetEntity
          .thumbnailDataWithSize(const ThumbnailSize(200, 200));
      if (uint8Listvalue != null) {
        emit(
          state.copyWith(uint8List: [uint8Listvalue]),
        );
      }
    }
    emit(
      state.copyWith(currentPage: state.currentPage + 1, isLoadin: false),
    );
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        (state.uint8List.length >= _sizeValue * state.currentPage) &&
        !state.isLoadin) {
      _fetchAssetsFromPath();
    }
  }

  Future<File> uint8ListToFile(Uint8List uint8List) async {
    final directory = await getTemporaryDirectory();
    final uniqueFileName = '${const Uuid().v4()}.jpg';
    final path = '${directory.path}/$uniqueFileName';
    final file = File(path);
    await file.writeAsBytes(uint8List);
    return file;
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
