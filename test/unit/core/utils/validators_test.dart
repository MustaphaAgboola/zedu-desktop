import 'package:zedu/core/core.dart';

import '../../../helpers/helpers.dart';

class _MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('Validators.validateEmail', () {
    final context = _MockBuildContext();

    test('accepts a valid email', () {
      expect(Validators.validateEmail(context, 'john@example.com'), isNull);
    });

    test('accepts an email with leading or trailing whitespace', () {
      expect(Validators.validateEmail(context, ' john@example.com '), isNull);
      expect(Validators.validateEmail(context, 'john@example.com\t'), isNull);
    });

    test('returns required error for null, empty or whitespace-only', () {
      expect(Validators.validateEmail(context, null), 'Email is required');
      expect(Validators.validateEmail(context, ''), 'Email is required');
      expect(Validators.validateEmail(context, '   '), 'Email is required');
    });

    test('returns invalid error for a malformed email', () {
      expect(
        Validators.validateEmail(context, 'john@'),
        'Please enter a valid email',
      );
    });
  });
}
