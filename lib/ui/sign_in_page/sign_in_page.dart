import 'package:bloc_pattern_demo/framework/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:bloc_pattern_demo/framework/blocs/sign_in_bloc/sign_in_event.dart';
import 'package:bloc_pattern_demo/framework/blocs/sign_in_bloc/sign_in_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final signInBlocWatch = context.watch<SignInBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (BuildContext context, state) {
                if (state is SignInErrorState) {
                  return Text(
                    state.errorMsg,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  );
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (emailValue) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInOnChangedEvent(emailController.text, passwordController.text),
                );
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: (passwordValue) {
                BlocProvider.of<SignInBloc>(context).add(
                  SignInOnChangedEvent(emailController.text, passwordController.text),
                );
              },
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if(state is SignInLoadingState){
                  return const Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  onPressed: () {
                    if(state is SignInValidateState){
                      BlocProvider.of<SignInBloc>(context).add(
                        SignInSubmittedEvent(emailController.text, passwordController.text),
                      );
                    }
                  },
                  color: (state is SignInValidateState) ? Colors.blue : Colors.grey,
                  child: const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
