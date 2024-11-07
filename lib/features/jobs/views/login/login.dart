import 'package:flutter/material.dart';
import 'package:job_scraper/common/styles/spacing_styles.dart';
import 'package:job_scraper/features/jobs/views/login/widgets/login_form.dart';
import 'package:job_scraper/features/jobs/views/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Header
              TLoginHeader(),

              // Form
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
