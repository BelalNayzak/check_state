part of 'check_state.dart';

class DefaultLoader extends StatelessWidget {
  const DefaultLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(child: Center(child: CupertinoActivityIndicator()));
  }
}
