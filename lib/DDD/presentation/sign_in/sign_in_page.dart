

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muticam_dashboard/DDD/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:muticam_dashboard/DDD/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:muticam_dashboard/injection.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: BlocProvider(
        create: (context) => getIt<SignInFormBloc>(),
        child: SignInForm(),),
    );
  }
  
}