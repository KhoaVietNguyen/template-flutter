import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:template/i10n/locale_keys.dart';

part 'paging/first_page_error.dart';
part 'paging/new_page_error.dart';
part 'paging/no_items_found.dart';
part 'paging/no_more_items.dart';

class CommonPagedList<T> extends StatelessWidget {
  const CommonPagedList({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    this.header,
    this.footer,
    this.noDataText,
  });

  final PagingController pagingController;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? header;
  final Widget? footer;
  final String? noDataText;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => pagingController.refresh(),
      ),
      child: CustomScrollView(
        key: const Key('common_list_view'),
        slivers: [
          if (header != null) SliverToBoxAdapter(child: header!),
          PagedSliverList(
            key: const Key('common_paged_list_view'),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) =>
                  itemBuilder.call(context, item as T, index),
              firstPageErrorIndicatorBuilder: (_) => FirstPageError(
                pagingController.error,
                onTryAgain: () => pagingController.refresh(),
              ),
              newPageErrorIndicatorBuilder: (_) => NewPageError(
                pagingController.error,
                onTryAgain: () => pagingController.refresh(),
              ),
              noItemsFoundIndicatorBuilder: (_) => NoItemsFound(
                noDataText ?? LocaleKeys.commonNoData.tr(),
                onTryAgain: () => pagingController.refresh(),
              ),
              noMoreItemsIndicatorBuilder: (_) => const NoMoreItems(),
            ),
          ),
          if (footer != null) SliverToBoxAdapter(child: footer!),
        ],
      ),
    );
  }
}
