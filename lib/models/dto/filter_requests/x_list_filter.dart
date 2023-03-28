import 'package:freezed_annotation/freezed_annotation.dart';

part 'x_list_filter.freezed.dart';
part 'x_list_filter.g.dart';

@unfreezed
class XListFilter with _$XListFilter {
  XListFilter._();

  factory XListFilter({
    @Default([]) List<String> states,
    String? keyWord,
    double? priceFrom,
    double? priceTo,
    bool? soldOut,
  }) = __$XListFilter;

  factory XListFilter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$XListFilterFromJson(json);

  void resetData() {
    states = [];
    keyWord = null;
    priceFrom = null;
    priceTo = null;
    soldOut = null;
  }

  int get numberOfFilter {
    return (states.isEmpty ? 1 : 0) +
        (priceFrom != null ? 1 : 0) +
        (priceTo != null ? 1 : 0) +
        (soldOut != null ? 1 : 0) +
        (keyWord != null ? 1 : 0);
  }
}
