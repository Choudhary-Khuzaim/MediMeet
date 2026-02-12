import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../utils/app_colors.dart';
import '../providers/auth_provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _agreeToTerms = false;

  void _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please accept terms & conditions'),
            backgroundColor: AppColors.warning,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }
      setState(() => _isLoading = true);
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final success = await authProvider.signup(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _phoneController.text.trim(),
        _passwordController.text,
      );
      if (mounted) {
        setState(() => _isLoading = false);
        if (success) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created successfully!'),
              backgroundColor: AppColors.success,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background Decor
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.secondary.withOpacity(0.1),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ).animate().fadeIn(duration: 1.seconds).scale(),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: AppColors.softShadow,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 20,
                        ),
                      ),
                    ).animate().fadeIn().slideX(begin: -0.5),

                    const SizedBox(height: 30),
                    Text(
                      'Create Your\nAccount',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 34,
                        color: AppColors.textPrimary,
                        height: 1.1,
                      ),
                    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),

                    const SizedBox(height: 12),
                    Text(
                      'Join thousands of users who trust Medimeet for their healthcare needs.',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                      ),
                    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),

                    const SizedBox(height: 40),

                    // Input Fields
                    _buildInputField(
                      controller: _nameController,
                      label: 'Full Name',
                      hint: 'John Doe',
                      icon: Icons.person_outline_rounded,
                    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),

                    const SizedBox(height: 20),
                    _buildInputField(
                      controller: _emailController,
                      label: 'Email Address',
                      hint: 'name@example.com',
                      icon: Icons.alternate_email_rounded,
                      type: TextInputType.emailAddress,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Enter your email';
                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(v)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2),

                    const SizedBox(height: 20),
                    _buildInputField(
                      controller: _phoneController,
                      label: 'Phone Number',
                      hint: '+1 234 567 890',
                      icon: Icons.phone_android_rounded,
                      type: TextInputType.phone,
                    ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2),

                    const SizedBox(height: 20),
                    _buildInputField(
                      controller: _passwordController,
                      label: 'Security Password',
                      hint: '••••••••',
                      icon: Icons.lock_outline_rounded,
                      isPass: true,
                      obscure: _obscurePassword,
                      onToggle: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2),

                    const SizedBox(height: 24),
                    _buildTermsCheck().animate().fadeIn(delay: 900.ms),

                    const SizedBox(height: 40),

                    // Signup Button
                    SizedBox(
                      width: double.infinity,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleSignup,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 8,
                          shadowColor: AppColors.primary.withOpacity(0.3),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ).animate().fadeIn(delay: 1.seconds).scale(),

                    const SizedBox(height: 32),

                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animate().fadeIn(delay: 1.1.seconds),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool isPass = false,
    bool obscure = false,
    VoidCallback? onToggle,
    TextInputType type = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: type,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primary, size: 22),
            suffixIcon: isPass
                ? IconButton(
                    icon: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                    ),
                    onPressed: onToggle,
                  )
                : null,
            fillColor: Colors.white,
            filled: true,
          ),
          validator:
              validator ?? (v) => v!.isEmpty ? 'This field is required' : null,
        ),
      ],
    );
  }

  Widget _buildTermsCheck() {
    return InkWell(
      onTap: () => setState(() => _agreeToTerms = !_agreeToTerms),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            AnimatedContainer(
              duration: 200.ms,
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: _agreeToTerms ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: _agreeToTerms ? AppColors.primary : AppColors.border,
                  width: 2,
                ),
                boxShadow: _agreeToTerms
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: _agreeToTerms
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                'I agree to the Terms of Service and Privacy Policy',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
