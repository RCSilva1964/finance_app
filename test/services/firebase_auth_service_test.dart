import 'package:finance_app/common/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_classes.dart';

void main() {
  late MockFirebaseAuthService mockFirebaseAuthService;
  // ignore: unused_local_variable
  late UserModel user;

  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(name: 'User', email: 'user@email.com', id: '1a2b3c4d5e');
  });

  test('Test Sign Up Success', () async {
    final user = UserModel(
      name: 'User',
      email: 'user@email.com',
      id: '1a2b3c4d5e',
    );
    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      ),
    ).thenAnswer((_) async => user);

    final result = await mockFirebaseAuthService.signUp(
      name: 'User',
      email: 'user@email.com',
      password: 'user@123',
    );

    expect(result, user);
  });

  test('Test Sign Up Failure', () async {
    when(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      ),
    ).thenThrow(Exception());

    expect(
      () => mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      ),
      // throwsA(isInstanceOf<Exception>()),
      throwsException,
    );
  });
}
