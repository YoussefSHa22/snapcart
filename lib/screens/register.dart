import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:e_commerce/screens/log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authorization/auth_cubit.dart';
import '../blocs/authorization/auth_states.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: AppColors.secondryColor),
          Positioned(
              top: -40,
              left: 0,
              right: 0,
              child: Image.asset('assets/images/Ellipse 6 (1).png')),
          Positioned(
              top: -40,
              left: 0,
              child: Image.asset('assets/images/Ellipse 6 (1).png')),
          Positioned(
              top: -40,
              right: 0,
              child: Image.asset('assets/images/Ellipse 6 (1).png')),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30, top: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset('assets/images/Ellipse 8.png')),
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset('assets/images/Creativity-pana 1.png')),
          Positioned(
            top: 90,
            left: 20,
            child: Text(
              'Create \nAccount',
              style: AppTextStyles.header.copyWith(
                fontSize: 45,
                color: AppColors.secondryColor,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: 25,
            child: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Registration Successful")),
                  );
                  // Navigate to the login page or home page
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return InkWell(
                  onTap: () {
                    context.read<AuthCubit>().register(
                          nameController.text,
                          phoneController.text,
                          emailController.text,
                          passwordController.text,
                        );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.header.copyWith(
                            fontSize: 30,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Image.asset(
                          'assets/images/icon (10).png',
                          color: AppColors.secondryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 40,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogIn(),
                    ));
              },
              child: Text(
                'Log In?',
                style: AppTextStyles.header.copyWith(
                  fontSize: 30,
                  color: AppColors.secondryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
