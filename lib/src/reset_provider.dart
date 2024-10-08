import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Reset {
  final Function() value;
  Reset(this.value);
}

class ResetProvider extends StatefulWidget {
  final Widget Function(Widget defaultResetChild)? resetBodyBuilder;
  final Widget child;

  const ResetProvider({super.key, this.resetBodyBuilder, required this.child});

  @override
  State<ResetProvider> createState() => _ResetProviderState();
}

class _ResetProviderState extends State<ResetProvider> {
  bool _isResetting = false;

  @override
  Widget build(BuildContext context) {
    final resetBodyBuilder = widget.resetBodyBuilder ?? (child) => child;
    return Provider<Reset>.value(
      value: Reset(() async {
        setState(() => _isResetting = true);
        await Future.delayed(const Duration(milliseconds: 1000));
        if (!mounted) return;
        setState(() => _isResetting = false);
      }),
      child: _isResetting ? resetBodyBuilder(const _ResetBody()) : widget.child,
    );
  }
}

class _ResetBody extends StatelessWidget {
  const _ResetBody();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
