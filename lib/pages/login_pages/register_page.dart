import 'package:conin/routes/route.dart';
import 'package:conin/services/service_login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:conin/providers/provider_register.dart';

class RegisterPageConin extends StatefulWidget {
  const RegisterPageConin({super.key});

  @override
  State<RegisterPageConin> createState() => _RegisterPageConinState();
}

class _RegisterPageConinState extends State<RegisterPageConin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding: const EdgeInsets.only(bottom: 0, top: 10),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.blue,
                  ]),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  ChangeNotifierProvider(
                    create: (context) => ProviderRegister(),
                    child: _RegisterForm(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text.rich(
                    TextSpan(
                      text: '¿Ya tienes una cuenta?',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Inicia Sesion',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  bool _ispassowrd = true;

  void _viewPassword() {
    setState(() {
      _ispassowrd = !_ispassowrd;
    });
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<ProviderRegister>(context);

    return SizedBox(
      child: Form(
        key: registerProvider.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Crear Cuenta',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: _builDecoration(
                  hintText: 'Nombre Completo',
                  prefixIcon: const Icon(Icons.person, color: Colors.black),
                ),
                onChanged: (value) => registerProvider.nombre = value,
                validator: (value) {
                  String caracteres = r'^[a-zA-Z][a-zA-Z ]*[a-zA-Z]$';
                  RegExp regExp = RegExp(caracteres);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'No es un correo valido';
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: _builDecoration(
                  hintText: 'Codigo de Equipo',
                  prefixIcon: const Icon(Icons.group, color: Colors.black),
                ),
                onChanged: (value) => registerProvider.codequipo = value,
                validator: (value) {
                  String caracteres = r'^[a-zA-Z][a-zA-Z ]*[a-zA-Z]$';
                  RegExp regExp = RegExp(caracteres);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'No es un correo valido';
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: _builDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email, color: Colors.black),
                ),
                onChanged: (value) => registerProvider.email = value,
                validator: (value) {
                  String caracteres =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = RegExp(caracteres);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'No es un correo valido';
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                obscureText: _ispassowrd,
                keyboardType: TextInputType.text,
                decoration: _builDecoration(
                  hintText: 'Contraseña',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: InkWell(
                    onTap: _viewPassword,
                    child: Icon(
                      _ispassowrd ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
                onChanged: (value) => registerProvider.password = value,
                validator: (value) {
                  return (value != null && value.length >= 8)
                      ? null
                      : 'La contraseña debe tener al menos 8 caracteres';
                },
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 60,
                width: 250,
                child: MaterialButton(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  disabledColor: Colors.blueAccent,
                  elevation: 1,
                  onPressed: registerProvider.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final registerConinService =
                              Provider.of<LoginConinService>(context,
                                  listen: false);
                          if (!registerProvider.isValidForm()) return;

                          registerProvider.isLoading = true;
                          // ignore: unnecessary_nullable_for_final_variable_declarations
                          final String? errorMessage =
                              await registerConinService.registerUser(
                                  registerProvider.nombre,
                                  registerProvider.codequipo,
                                  registerProvider.email,
                                  registerProvider.password);

                          if (errorMessage == null) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(context, '/login');
                          } else {
                            registerProvider.isLoading = false;
                          }
                        },
                  child: (registerProvider.isLoading)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('REGISTRAR',
                          style: TextStyle(color: Colors.white)),
                  // const Text(
                  //   'INGRESAR',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration _builDecoration({
  final String? hintText,
  final Widget? prefixIcon,
  final Widget? suffixIcon,
}) {
  return InputDecoration(
      errorStyle: const TextStyle(fontSize: 15, color: Colors.red),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15)),
      border: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(15),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.all(18));
}
