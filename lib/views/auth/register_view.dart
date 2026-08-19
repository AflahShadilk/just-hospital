import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:justhospital/controllers/register_controller.dart';
import 'package:justhospital/core/app/theme/app_theme.dart';


class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            24,
            20,
            24,
            32,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              logoBuild(),

              const SizedBox(height: 24),

              Text(
                'Create your account',
                style: theme.textTheme.headlineLarge,
              ),

              const SizedBox(height: 8),

              Text(
                'Create an account to find hospitals and healthcare near you.',
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 28),

              label(
                'Full Name',
                theme,
              ),

              const SizedBox(height: 8),

              TextField(
                controller:
                    controller.nameController,
                textCapitalization:
                    TextCapitalization.words,
                textInputAction:
                    TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Enter your full name',
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              label(
                'Email',
                theme,
              ),

              const SizedBox(height: 8),

              TextField(
                controller:
                    controller.emailController,
                keyboardType:
                    TextInputType.emailAddress,
                textInputAction:
                    TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              label(
                'Phone Number',
                theme,
              ),

              const SizedBox(height: 8),

              TextField(
                controller:
                    controller.phoneController,
                keyboardType:
                    TextInputType.phone,
                textInputAction:
                    TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              label(
                'Password',
                theme,
              ),

              const SizedBox(height: 8),

              Obx(
                () => TextField(
                  controller:
                      controller.passwordController,
                  obscureText:
                      controller.obscurePassword.value,
                  textInputAction:
                      TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Create a password',
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                    ),
                    suffixIcon: IconButton(
                      onPressed: controller
                          .togglePasswordVisibility,
                      icon: Icon(
                        controller
                                .obscurePassword.value
                            ? Icons
                                .visibility_outlined
                            : Icons
                                .visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              label(
                'Confirm Password',
                theme,
              ),

              const SizedBox(height: 8),

              Obx(
                () => TextField(
                  controller: controller
                      .confirmPasswordController,
                  obscureText: controller
                      .obscureConfirmPassword.value,
                  textInputAction:
                      TextInputAction.done,
                  onSubmitted: (_) {
                    controller.register();
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm your password',
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                    ),
                    suffixIcon: IconButton(
                      onPressed: controller
                          .toggleConfirmPasswordVisibility,
                      icon: Icon(
                        controller
                                .obscureConfirmPassword
                                .value
                            ? Icons
                                .visibility_outlined
                            : Icons
                                .visibility_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              passwordRequirements(theme),

              const SizedBox(height: 28),

              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        controller.isLoading.value
                            ? null
                            : controller.register,
                    child: controller.isLoading.value
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child:
                                CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Create Account',
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoBuild() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: AppTheme.primaryLightColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Icon(
        Icons.local_hospital_rounded,
        size: 34,
        color: AppTheme.primaryColor,
      ),
    );
  }

  Widget label(
    String text,
    ThemeData theme,
  ) {
    return Text(
      text,
      style: theme.textTheme.titleMedium,
    );
  }

  Widget passwordRequirements(
    ThemeData theme,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryLightColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            'Password requirements',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            '• At least 8 characters\n'
            '• One uppercase letter\n'
            '• One lowercase letter\n'
            '• One number\n'
            '• One special character',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}