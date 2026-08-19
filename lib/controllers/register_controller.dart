import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/core/app/routes/app_routes.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController =
      TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool obscurePassword = true.obs;
  final RxBool obscureConfirmPassword = true.obs;

  Future<void> register() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final password = passwordController.text;
    final confirmPassword =
        confirmPasswordController.text;

    final nameError = validateName(name);

    if (nameError != null) {
      showError(nameError);
      return;
    }

    final emailError = validateEmail(email);

    if (emailError != null) {
      showError(emailError);
      return;
    }

    final phoneError = validatePhone(phone);

    if (phoneError != null) {
      showError(phoneError);
      return;
    }

    final passwordError =
        validatePassword(password);

    if (passwordError != null) {
      showError(passwordError);
      return;
    }

    if (password != confirmPassword) {
      showError('Passwords do not match.');
      return;
    }

    isLoading.value = true;

    try {
      final credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        showError(
          'Unable to create your account.',
        );
        return;
      }

      await user.updateDisplayName(name);

      await _firestore
          .collection('users')
          .doc(user.uid)
          .set({
        'name': name,
        'email': email,
        'phone': phone,
        'createdAt':
            FieldValue.serverTimestamp(),
      });

      Get.offNamed(AppRoutes.home);
    } on FirebaseAuthException catch (error) {
      showError(
        getErrorMessage(error),
      );
    } catch (_) {
      showError(
        'Something went wrong. Please try again.',
      );
    } finally {
      isLoading.value = false;
    }
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return 'Please enter your name.';
    }

    if (name.length < 2) {
      return 'Name must contain at least 2 characters.';
    }

    if (name.length > 60) {
      return 'Name cannot exceed 60 characters.';
    }

    return null;
  }

  String? validateEmail(String email) {
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

  String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return 'Please enter your phone number.';
    }

    final cleanedPhone =
        phone.replaceAll(RegExp(r'[\s-]'), '');

    if (!RegExp(r'^\+?[0-9]{10,15}$')
        .hasMatch(cleanedPhone)) {
      return 'Please enter a valid phone number.';
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter a password.';
    }

    if (password.length < 8) {
      return 'Password must contain at least 8 characters.';
    }

    if (password.length > 128) {
      return 'Password cannot exceed 128 characters.';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain an uppercase letter.';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain a lowercase letter.';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain a number.';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]]')
        .hasMatch(password)) {
      return 'Password must contain a special character.';
    }

    return null;
  }

  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.toggle();
  }

  String getErrorMessage(
    FirebaseAuthException error,
  ) {
    switch (error.code) {
      case 'email-already-in-use':
        return 'An account already exists with this email.';

      case 'invalid-email':
        return 'Please enter a valid email address.';

      case 'weak-password':
        return 'The password is too weak.';

      case 'network-request-failed':
        return 'Network error. Please check your internet connection.';

      case 'operation-not-allowed':
        return 'Email/password registration is not enabled.';

      default:
        return 'Unable to create account. Please try again.';
    }
  }

  void showError(String message) {
    Get.snackbar(
      'Registration Failed',
      message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}