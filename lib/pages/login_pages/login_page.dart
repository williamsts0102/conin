import 'package:conin/routes/route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            padding: const EdgeInsets.only(bottom: 10, top: 30),
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
                    height: 220,
                    child: Lottie.asset('assets/lottie/login_conin.json'),
                    // child: Image.network(
                    //     'https://cdn.pixabay.com/photo/2022/12/12/12/58/dog-7651002_960_720.jpg'),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const _LoginForm(),
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
  bool _isPass = true;

  void _viewPassword() {
    setState(() {
      _isPass = !_isPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        // key: prov_login.formKey,
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
                onChanged: (value) {},
                validator: (value) {},
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                autocorrect: false,
                obscureText: _isPass,
                keyboardType: TextInputType.text,
                decoration: _builDecoration(
                  hintText: 'Contraseña',
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  suffixIcon: InkWell(
                    child: Icon(
                      _isPass ? Icons.visibility : Icons.visibility_off,
                    ),
                    onTap: () {},
                  ),
                ),
                onChanged: (value) {},
                validator: ((value) {}),
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
                  disabledColor: Colors.purple,
                  elevation: 1,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, MyRoutes.rHome);
                  },
                  child: const Text(
                    'INGRESAR',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
      errorStyle: const TextStyle(fontSize: 15, color: Colors.white60),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(15)),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(15),
      ),
      filled: true,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.all(18));
}
