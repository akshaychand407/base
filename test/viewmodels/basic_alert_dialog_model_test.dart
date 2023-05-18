import 'package:flutter_test/flutter_test.dart';
import 'package:base/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('BasicAlertDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
