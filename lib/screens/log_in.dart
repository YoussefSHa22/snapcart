import 'package:e_commerce/constants/color_constants.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:e_commerce/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/authorization/auth_cubit.dart';
import '../blocs/authorization/auth_states.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: AppColors.secondryColor),
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset('assets/images/Ellipse 6 (3).png')),
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset('assets/images/Ellipse 9.png')),
          Positioned(
              left: 0,
              top: 0,
              child: Image.asset('assets/images/Ellipse 10.png')),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Text(
                      'Sign In',
                      style: AppTextStyles.header.copyWith(fontSize: 50),
                    ),
                  ),
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
              top: 30,
              right: 45,
              child: Image.asset('assets/images/Creativity-pana 1 (2).png')),
          Positioned(
            bottom: 210,
            right: 25,
            child: BlocConsumer<AuthCubit, AuthStates>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login Successful")),
                  );
                  // Navigate to home or any other page if needed
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
                    context.read<AuthCubit>().login(
                          emailController.text,
                          passwordController.text,
                        );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          'Sign In',
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
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ));
              },
              child: Text(
                'Register?',
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
