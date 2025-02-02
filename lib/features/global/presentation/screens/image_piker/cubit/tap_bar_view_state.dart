// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tap_bar_view_cubit.dart';

class TapBarViewState extends Equatable {
  const TapBarViewState({
    this.uint8List = const [],
    this.currentPage = 0,
    this.isLoadin = false,
  });
  final List<Uint8List?> uint8List;
  final int currentPage;
  final bool isLoadin;

  TapBarViewState copyWith({
    List<Uint8List?>? uint8List,
    int? currentPage,
    bool? isLoadin,
  }) {
    return TapBarViewState(
      uint8List: uint8List ?? this.uint8List,
      currentPage: currentPage ?? this.currentPage,
      isLoadin: isLoadin ?? this.isLoadin,
    );
  }

  @override
  List<Object?> get props => [uint8List, currentPage, isLoadin];

  @override
  String toString() {
    const maxLength = 5;
    final uint8ListString = uint8List.map((e) {
      if (e != null && e.length > maxLength) {
        return '${e.sublist(0, maxLength)}...';
      }
      return e.toString();
    }).join(', ');

    return 'TapBarViewState(uint8List: [$uint8ListString], currentPage: $currentPage, isLoadin: $isLoadin)';
  }
}
