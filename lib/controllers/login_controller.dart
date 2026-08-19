import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/core/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    final emailError = _validateEmail(email);

    if (emailError != null) {
      _showError(emailError);
      return;
    }

    final passwordError =
        _validatePassword(password);

    if (passwordError != null) {
      _showError(passwordError);
      return;
    }

    isLoading.value = true;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offNamed(AppRoutes.home);
    } on FirebaseAuthException catch (error) {
      _showError(
        _getErrorMessage(error),
      );
    } catch (_) {
      _showError(
        'Something went wrong. Please try again.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  String? _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email.';
    }

    if (email.contains(' ')) {
      return 'Email cannot contain spaces.';
    }

    if (email.length > 254) {
      return 'Email address is too long.';
    }

    if (!GetUtils.isEmail(email)) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  String? _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password.';
    }

    if (password.length < 8) {
      return 'Password must contain at least 8 characters.';
    }

    if (password.length > 128) {
      return 'Password cannot exceed 128 characters.';
    }

    if (password.trim().isEmpty) {
      return 'Please enter a valid password.';
    }

    return null;
  }

  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

  String _getErrorMessage(
    FirebaseAuthException error,
  ) {
    switch (error.code) {
      case 'invalid-credential':
        return 'Invalid email or password.';

      case 'user-not-found':
        return 'No account found with this email.';

      case 'wrong-password':
        return 'Incorrect password.';

      case 'invalid-email':
        return 'Please enter a valid email address.';

      case 'user-disabled':
        return 'This account has been disabled.';

      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';

      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';

      default:
        return 'Unable to login. Please try again.';
    }
  }

  void _showError(String message) {
    Get.snackbar(
      'Login Failed',
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}