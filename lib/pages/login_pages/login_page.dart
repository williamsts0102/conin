import 'package:conin/routes/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:conin/providers/provider_login.dart';

class LoginPageConin extends StatefulWidget {
  const LoginPageConin({super.key});

  @override
  State<LoginPageConin> createState() => _LoginPageConinState();
}

class _LoginPageConinState extends State<LoginPageConin> {
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
                  SizedBox(
                    width: 300,
                    height: 205,
                    child: Lottie.asset('assets/lottie/login_conin.json'),
                    // child: Image.network(
                    //     'https://cdn.pixabay.com/photo/2022/12/12/12/58/dog-7651002_960_720.jpg'),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  ChangeNotifierProvider(
                      create: (context) => ProviderLogin(),
                      child: const _LoginForm()),
                  const SizedBox(
                    height: 50,
                  ),
                  Text.rich(
                    TextSpan(
                      text: '¿No tienes cuenta?',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Registrate',
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginPageConin()));
                              // Navigator.pushNamed(context, MyRoutes.rHome);
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

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _ispassowrd = true;

  void _viewPassword() {
    setState(() {
      _ispassowrd = !_ispassowrd;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<ProviderLogin>(context);

    return SizedBox(
      child: Form(
        key: loginProvider.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: _builDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email, color: Colors.black),
                ),
                onChanged: (value) => loginProvider.email = value,
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
                onChanged: (value) => loginProvider.password = value,
                validator: (value) {
                  return (value != null && value.length >= 8)
                      ? null
                      : 'La contraseña debe tener al menos 8 caracteres';
                },
              ),
              const SizedBox(
                height: 15,
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
                  onPressed: loginProvider.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          if (!loginProvider.isValidForm()) return;

                          loginProvider.isLoading = true;
                          await Future.delayed(
                            const Duration(seconds: 2),
                          );
                          loginProvider.isLoading = false;
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(
                              context, MyRoutes.rHome);
                        },
                  child: (loginProvider.isLoading)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text('INGRESAR',
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
