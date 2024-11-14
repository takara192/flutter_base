import 'dart:math';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.appBar,
    required this.body,
    this.canRefresh = false,
    this.onRefresh,
  });

  final AppBar appBar;
  final Widget body;
  final bool canRefresh;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    assert(
        (canRefresh && onRefresh != null) || (!canRefresh && onRefresh == null),
        'canRefresh and onRefresh must be set together');
    return Scaffold(
      appBar: appBar,
      body: canRefresh
          ? CustomMaterialIndicator(
              onRefresh: () async {
                onRefresh?.call();
              },
              indicatorBuilder: (context, controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    color: Colors.lightBlueAccent,
                    value: controller.state.isLoading
                        ? null
                        : min(controller.value, 1.0),
                  ),
                );
              },
              child: body,
            )
          : body,
    );
  }
}
