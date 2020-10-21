import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:returning_home/ui/notifiers/error_notifier.dart';
import 'package:returning_home/ui/notifiers/loading_notifier.dart';
import 'package:returning_home/ui/widgets/loading.dart';
import 'package:returning_home/ui/widgets/unfocus.dart';

class BaseViewOnScaffold extends HookWidget {
  const BaseViewOnScaffold({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderListener<StateController<ErrorState>>(
      provider: errorStateNotifierProvider,
      onChange: (context, errorState) {
        if (errorState.state.hasError) {
          final scaffoldFeatureController = Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(errorState.state.appError.message),
            ),
          );
          scaffoldFeatureController.closed.whenComplete(() {
            context.read(errorStateNotifierProvider).state =
                const ErrorState(hasError: false);
          });
        }
      },
      child: ProviderListener<StateController<LoadingState>>(
        provider: loadingNotifierProvider,
        onChange: (context, loadingState) {
          if (loadingState.state.isLoadingOverlay) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return WillPopScope(
                  onWillPop: () async => false,
                  child: Loading(),
                );
              },
            );
            return;
          }
        },
        child: UnFocus(
          child: child,
        ),
      ),
    );
  }
}
