import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

/// Factory that returns the dependency scope.
typedef ScopeFactory<T> = T Function(BuildContext context);

/// Di container. T - return type(for example [AppScope]).
class DiScope<T> extends SingleChildStatefulWidget {
  /// Create an instance [DiScope].
  const DiScope({
    required this.onFactory,
    this.onDispose,
    super.key,
    super.child,
  });

  /// Factory that returns the dependency scope.
  final ScopeFactory<T> onFactory;

  /// The method called when disposing the widget.
  final ValueChanged<T>? onDispose;

  @override
  State<DiScope<T>> createState() => _DiScopeState<T>();
}

class _DiScopeState<T> extends SingleChildState<DiScope<T>> {
  late final T _scope;

  @override
  void initState() {
    super.initState();
    _scope = widget.onFactory(context);
  }

  @override
  void dispose() {
    widget.onDispose?.call(_scope);
    super.dispose();
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return Provider<T>(
      create: (_) => _scope,
      child: child,
    );
  }
}
