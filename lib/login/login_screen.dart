import 'package:flutter/material.dart';
import 'package:flutter_login_demo/login/social_login_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _formKey = GlobalKey<FormState>();
  var _regularTextStyle = TextStyle(fontSize: 16, color: Colors.black);
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context)=> Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              _buildNameField(),
              _buildEmailField(),
              _buildPasswordField(),
              _buildTermConditionField(),
              _buildSignUpBtn(context),
              SocialLogin(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildNameField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _checkEmptyValidation,
      decoration: inputDecoration("Your Name"),
    );
  }

  TextFormField _buildEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: _checkEmptyValidation,
      decoration: inputDecoration("Email"),
    );
  }

  var isPasswordVisible = true;

  TextFormField _buildPasswordField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: _checkEmptyValidation,
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        labelText: "Password",
        labelStyle: _regularTextStyle,
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            child: Icon(
              isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.black45,
            )),
      ),
    );
  }

  Widget _buildTermConditionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22.0),
      child: Center(
        child: RichText(
            text: TextSpan(
                text: "Terms of Use",
                style: _regularTextStyle,
                children: [
              TextSpan(
                text: " and ",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              TextSpan(
                text: "Privecy Policy",
                style: _regularTextStyle,
              )
            ])),
      ),
    );
  }

  Widget _buildSignUpBtn(BuildContext ctx) {
    return Container(
      height: 45,
      child: RaisedButton(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Text(
          "Sign Up",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _onSignUpClicked(ctx),
      ),
    );
  }

  InputDecoration inputDecoration(String _labelName) {
    return InputDecoration(
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        labelText: _labelName,
        labelStyle: _regularTextStyle);
  }

  String _checkEmptyValidation(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  void _onSignUpClicked(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Successfully sign up")));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
