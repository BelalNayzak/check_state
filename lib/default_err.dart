part of 'check_state.dart';

class DefaultErr extends StatelessWidget {
  const DefaultErr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(child: Center(child: Text('Something went wrong')));
  }
}
