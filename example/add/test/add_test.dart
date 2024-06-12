import 'package:add/add.dart';
import 'package:test/test.dart';

void main() {
  group('Function: add', () {
    // Exemplo de testes que passam
    test('Should return 4 when input is a = 1 and b = 3', () {
      expect(add(1, 3), equals(4));
    });
    test('Should return 7 when input is a = 4 and b = 3', () {
      // local setup
      const a = 4;
      const b = 3;
      const expectedResult = 7;

      // act
      final result = add(a, b);

      // expect
      expect(result, equals(expectedResult));
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

  group('Principais Matchers', () {
    group('Matcher: equals', () {
      test('10 == 10', () {
        expect(10, equals(10));
      });
      test('[1, 2, 3] == [1, 2, 3]', () {
        expect([1, 2, 3], equals([1, 2, 3]));
      });
      test('Exemplo de falha: equals', () {
        expect(10, equals(11));
      });
    });
    group('Matcher: isNot', () {
      test('10 != 11', () {
        expect(10, isNot(equals(11)));
      });
      test('10 != 11 também funcionará', () {
        expect(10, isNot(11));
      });
      test('Exemplo de falha: isNot', () {
        expect(10, isNot(equals(10)));
      });
    });
    group('Matcher: isNull/isNotNull', () {
      test('is null', () {
        expect(null, isNull);
      });
      test('is not null', () {
        expect('', isNotNull);
        expect(10, isNotNull);
      });
      test('Exemplo de falha: isNotNull', () {
        expect(null, isNotNull);
      });
      test('Exemplo de falha: isNull', () {
        expect(10, isNull);
      });
    });
    group('Matcher: allOf', () {
      test('Should be an even integer greater than 0', () {
        final dynamic actual = 12;
        expect(
            actual,
            allOf(
              isA<int>(),
              isPositive,
              predicate<int>((actual) => actual % 2 == 0, 'even'),
            ));
      });
      test('Exemplo que falha: allOf', () {
        final dynamic actual = 13;
        expect(
            actual,
            allOf(
              isA<int>(),
              isPositive,
              predicate<int>((actual) => actual % 2 == 0, 'even'),
            ));
      });
    });

    group('Matcher: unorderedEquals', () {
      test('[1, 2, 3] == [1, 2, 3]', () {
        expect([1, 2, 3], unorderedEquals([1, 2, 3]));
        expect([1, 2, 3], unorderedEquals([3, 1, 2]));
      });
      test('Exemplo que falha: unorderedEquals', () {
        expect([1, 2, 3], unorderedEquals([1, 3]));
      });
    });
    group('Matcher: throwException e outros', () {
      test('Errors and exceptions', () {
        expect(() => throw Exception(), throwsException);
        expect(() => throw StateError('invalid state'), throwsStateError);
        expect(() => throw 123, throwsA(isA<int>()));
      });
      test('Exemplo que falha 1: throwsException', () {
        expect(() => throw UnimplementedError(), throwsException);
      });
      test('Exemplo que falha 2: throwsException', () {
        expect(() {}, throwsException);
      });
    });
  });
}
