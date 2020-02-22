import 'dart:async';

class StreamTest {
  void addLessThanFive(StreamController controller, int value) {
    if (value < 5) {
      controller.sink.add(value);
    } else {
      controller.sink.addError(StateError('$value is not less than 5'));
    }
  }

  main() {
    final controller = StreamController();

    addLessThanFive(controller, 1);
    addLessThanFive(controller, 2);
    addLessThanFive(controller, 3);
    addLessThanFive(controller, 4);
    addLessThanFive(controller, 5);

    controller.sink.add(10.0);
    controller.sink.add('This is a String');
    controller.sink.add([11, 22, 33, 44]);
    controller.sink.add({'1': 1, '2': 2});

    controller.close();

    addLessThanFive(controller, 6);

    controller.stream.listen((value) {
      print(value);
    }, onError: (error) {
      print(error);
    }, onDone: () {
      print('done');
    });
  }
}
