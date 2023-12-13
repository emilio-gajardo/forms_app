part of 'register_cubit.dart';
// import 'package:forms_app/infrastructures/inputs/inputs.dart';

/// - Estados del formulario
enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;

  const RegisterFormState({
    this.formStatus = FormStatus.invalid, // por defecto el estado es invalido
    this.isValid = false,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Email? email,
    Password? password,
  }) => RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  /// - [props] : aquí se indican las propiedades consideradas para monitorizar el estado del objeto
  /// - Para que flutter bloc sepa cuando se ha cambiado el estado del objeto
  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
