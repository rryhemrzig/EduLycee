import 'package:flutter/material.dart';

void main() {
  runApp(const EduLyceeApp());
}

class EduLyceeApp extends StatelessWidget {
  const EduLyceeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EduLycee',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2457A7)),
      ),
      home: const LoginScreen(),
    );
  }
}

// ================= LOGIN SCREEN =================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  String selectedRole = 'Student';

  final List<String> roles = [
    'Student',
    'Teacher',
    'Parent',
    'Administration',
    'School Staff',
  ];

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 20),

                Container(
                  width: 78,
                  height: 78,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2457A7),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: 42,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'EduLycee',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF173B63),
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Your school space, wherever you go',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                ),

                const SizedBox(height: 35),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF173B63),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Sign in to your account',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                      ),

                      const SizedBox(height: 28),

                      const Text(
                        'Account Type',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 10),

                      DropdownButtonFormField<String>(
                        value: selectedRole,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          filled: true,
                          fillColor: const Color(0xFFF4F7FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        items: roles.map((role) {
                          return DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedRole = value;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        'Email or Username',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter your email or username',
                          prefixIcon: const Icon(Icons.email_outlined),
                          filled: true,
                          fillColor: const Color(0xFFF4F7FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: passwordController,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF4F7FC),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Password recovery will be available soon.',
                                ),
                              ),
                            );
                          },
                          child: const Text('Forgot Password?'),
                        ),
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (emailController.text.trim().isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill in all fields.'),
                                ),
                              );
                              return;
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '$selectedRole login: ready to connect.',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2457A7),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFF2457A7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  'EduLycee © 2026 - All rights reserved',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= SIGN UP SCREEN =================

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String selectedRole = 'Student';

  bool acceptTerms = false;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final List<String> roles = ['Student', 'Teacher', 'Parent', 'School Staff'];

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration fieldDecoration(
    String hint,
    IconData icon, {
    Widget? suffix,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      suffixIcon: suffix,
      filled: true,
      fillColor: const Color(0xFFF4F7FC),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 15),

                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2457A7),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'EduLycee',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF173B63),
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF173B63),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Join EduLycee and manage your school life.',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                      ),

                      const SizedBox(height: 24),

                      const Text(
                        'Full Name',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 9),

                      TextField(
                        controller: fullNameController,
                        decoration: fieldDecoration(
                          'Enter your full name',
                          Icons.person_outline,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Email Address',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 9),

                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: fieldDecoration(
                          'Enter your email address',
                          Icons.email_outlined,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Account Type',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 9),

                      DropdownButtonFormField<String>(
                        value: selectedRole,
                        decoration: fieldDecoration(
                          'Select your role',
                          Icons.person_outline,
                        ),
                        items: roles.map((role) {
                          return DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedRole = value;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Password',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 9),

                      TextField(
                        controller: passwordController,
                        obscureText: !passwordVisible,
                        decoration: fieldDecoration(
                          'Create a password',
                          Icons.lock_outline,
                          suffix: IconButton(
                            icon: Icon(
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Confirm Password',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 9),

                      TextField(
                        controller: confirmPasswordController,
                        obscureText: !confirmPasswordVisible,
                        decoration: fieldDecoration(
                          'Confirm your password',
                          Icons.lock_outline,
                          suffix: IconButton(
                            icon: Icon(
                              confirmPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                confirmPasswordVisible =
                                    !confirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Checkbox(
                            value: acceptTerms,
                            activeColor: const Color(0xFF2457A7),
                            onChanged: (value) {
                              setState(() {
                                acceptTerms = value ?? false;
                              });
                            },
                          ),
                          const Expanded(
                            child: Text(
                              'I agree to the Terms & Conditions',
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: () {
                            if (fullNameController.text.trim().isEmpty ||
                                emailController.text.trim().isEmpty ||
                                passwordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              showMessage('Please fill in all fields.');
                              return;
                            }

                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              showMessage('Passwords do not match.');
                              return;
                            }

                            if (!acceptTerms) {
                              showMessage(
                                'Please accept the Terms & Conditions.',
                              );
                              return;
                            }

                            showMessage(
                              'Account details are ready for registration.',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2457A7),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text('Already have an account? '),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(
                                  color: Color(0xFF2457A7),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'EduLycee © 2026 - All rights reserved',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
