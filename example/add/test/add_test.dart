import 'package:add/add.dart';
import 'package:test/test.dart';

void main() {
  group('Function: add', () {
    // Exemplo de testes que passam
    test('Should return 4 when input is a = 1 and b = 3', () {
      expect(add(1, 3), equals(4));
    });
    test('Should return 0 when input is a = -1 and b = 1', () {
      expect(add(-1, 1), equals(0));
    });
  });
  group('Function: incorrectAdd', () {
    // Exemplo de testes que falham
    test('Should return 4 when input is a = 1 and b = 3', () {
      expect(incorrectAdd(1, 3), equals(4));
    });
    test('Should return 0 when input is a = -1 and b = 1', () {
      expect(incorrectAdd(-1, 1), equals(0));
    });
  });
}
