part of '../common_paged_list.dart';

class NoItemsFound extends StatelessWidget {
  final String _message;
  final VoidCallback? onTryAgain;

  const NoItemsFound(this._message, {super.key, this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                key: const Key('page_error_reload_button'),
                onPressed: () => onTryAgain?.call(),
                icon: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
