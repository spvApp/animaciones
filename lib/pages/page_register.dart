import 'package:animaciones/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginRegister extends StatefulWidget {
  static const String ROUTE = "/login_register";

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister>
    with SingleTickerProviderStateMixin {
  //clase animable
  bool _loginView = false;

  late AnimationController _animationController;
  late Animation<Size> _heightAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _heightAnimation = Tween<Size>(
      begin: Size(double.infinity, 350),
      end: Size(double.infinity, 400),
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    _opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Animaciones"),
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        //height: _loginView ? 300 : 350,
        height: _heightAnimation.value.height,
        margin: EdgeInsets.all(8),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                CustomTextField(
                  icon: Icons.person,
                  placeholder: "Usuario",
                  primaryColor: Colors.purple,
                  accentColor: Colors.orange,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  icon: Icons.lock,
                  placeholder: "Contraseña",
                  obscureText: true,
                  primaryColor: Colors.purple,
                  accentColor: Colors.orange,
                ),
                SizedBox(
                  height: 15,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  constraints: BoxConstraints(
                      minHeight: _loginView ? 0 : 40,
                      maxHeight: _loginView ? 0 : 70),
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: CustomTextField(
                      icon: Icons.lock,
                      placeholder: "Repetir Contraseña",
                      obscureText: true,
                      primaryColor: Colors.purple,
                      accentColor: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    _loginView ? "Iniciar Sesión " : "Registrarse",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Spacer(),
                SwitchListTile(
                    title: Text(_loginView ? "Iniciar Sesión " : "Registrarse"),
                    value: _loginView,
                    onChanged: (value) {
                      setState(() {
                        _loginView = value;

                        if (_loginView) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
