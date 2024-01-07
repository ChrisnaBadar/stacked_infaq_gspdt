import 'package:flutter_test/flutter_test.dart';
import 'package:infaq/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DonatePageViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
