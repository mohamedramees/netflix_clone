import 'dart:async';
import 'dart:ui';

class Debouncer {
  final int delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: delay), action);
  }
}
final debouncer = Debouncer(delay: 300);

void onUserInput(String input) {
  debouncer.run(() {
    print("User input processed: $input");
  });
}
