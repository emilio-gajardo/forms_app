import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [

              FlutterLogo(size: 100),

              _RegisterForm(),

            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
      // key: _formKey,
      child: Column(
        children: [

          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Username',
            onChanged: registerCubit.usernameChanged,
            errorMessage: username.errorMessage,
            // errorMessage: username.displayError.toString(),// muesrta el tipo de error
          ),

          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Email',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
          const SizedBox(height: 20),

          CustomTextFormField(
            label: 'Password',
            obscureText: true,
            onChanged: registerCubit.passwordChanged,
            errorMessage: password.errorMessage,
          ),

          const SizedBox(height: 20),

          FilledButton.icon(
            onPressed: (){
              // final isValid = _formKey.currentState!.validate();
              // if (!isValid) return;
              registerCubit.onSubmit();
              // print('>> username: $username | email: $email | password: $password');
            },
            icon: const Icon(Icons.save),
            label: const Text('Guardar'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}