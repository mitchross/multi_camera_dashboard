import 'package:dartz/dartz.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muticam_dashboard/DDD/application/auth/sign_in_form/sign_in_form_bloc.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => {},
          (either) => either.fold((failure) {
            FlushbarHelper.createError(
              message: failure.map(
                  cancelledByUser: (_) => 'Cancelled',
                  serverError: (_) => 'Server Error',
                  emailAlreadyInUse: (_) => 'Email already in Use',
                  invalidEmailAndPasswordCombination: (_) => 'Invalid email and password combo'),
            ).show(context);
          }, (_) {}),
        );
      },
      builder: (context, state) {
        return Form(
            autovalidate: state.showErrorMessages,
            child: ListView(
              children: [
                const Text('📝',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 130)),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                  ),
                  autocorrect: false,
                  onChanged: (value) => context
                      .bloc<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value)),
                  validator: (_) => context
                      .bloc<SignInFormBloc>()
                      .state
                      .emailAddress
                      .value
                      .fold(
                        (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null),
                        (r) => null,
                      ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                  ),
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => context
                      .bloc<SignInFormBloc>()
                      .add(SignInFormEvent.passwordChanged(value)),
                  validator: (_) =>
                      context.bloc<SignInFormBloc>().state.password.value.fold(
                            (f) => f.maybeMap(
                                shortPassword: (_) => 'Invalid pass',
                                orElse: () => null),
                            (r) => null,
                          ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          context.bloc<SignInFormBloc>().add(
                                const SignInFormEvent
                                    .signInWithEmailAndPasswordPressed(),
                              );
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                    Expanded(
                        child: FlatButton(
                      onPressed: () {
                        context.bloc<SignInFormBloc>().add(
                              const SignInFormEvent
                                  .registerWithEmailAndPasswordPressed(),
                            );
                      },
                      child: const Text('Register'),
                    )),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    context.bloc<SignInFormBloc>().add(
                          const SignInFormEvent.signInWithGooglePressed(),
                        );
                  },
                  color: Colors.lightBlue,
                  child: const Text(
                    'Sign in with Google',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
