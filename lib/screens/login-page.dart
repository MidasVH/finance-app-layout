import 'package:finance_layout_test/services/authentication.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback loginCallback;

  LoginPage({this.auth, this.loginCallback});

  @override 
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

  @override 
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if(form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true; 
    }); 
    if(validateAndSave()) {
      String userId = "";
      try{
        if(_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in with $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          print('signed up with $userId');
        }
        setState(() {
          _isLoading = false;
        });
        if(userId.length > 0 && userId != null && _isLoading) {
          widget.loginCallback();
        }
      } catch(e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: new AppBar(
        title: new Text("Flutter login demo"),
      ),
      body: Stack(
          children: <Widget>[
            _showForm(),
            //showCircularProgress(),
          ],
        )
    );
  }

  Widget _showForm() {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showEmailInput(),
            showPasswordInput(),
            showPrimaryButton(),
            showSecondaryButton(),
            showErrorMessage(),
          ]
        )
      ),
    );
  }

  Widget showCircularProgress() {
    if(_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          icon: new Icon(
            Icons.email,
            color: Colors.grey,
          ),
        
        ),
        validator: (value) => value.isEmpty ? 'Email cannot be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput(){
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey,
          ),
          fillColor: Colors.white
        ),
        validator: (value) => value.isEmpty ? 'Password cannot be empty' : null,
        onSaved: (value) => _password = value.trim()
      )
    );
  }

  Widget showPrimaryButton(){
    return new Padding(
      padding: EdgeInsets.only(top: 45.0),
      child: SizedBox(
        height: 40.0,
        child: RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)
          ),
          color: Colors.grey,
          child: new Text(
            _isLoginForm ? 'Login' : 'Create account',
            style: new TextStyle(
              fontSize: 20.0,
            ),
          ),
          onPressed: validateAndSubmit,
        ),
      ),
    );
  }

  Widget showSecondaryButton() {
    return new FlatButton(
      child: new Text(
        _isLoginForm ? 'create an account' : 'Have an account? Sign in',
        style: new TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        )
      ),
      onPressed: toggleFormMode,
    );
  }

  Widget showErrorMessage() {
    if(_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: new TextStyle(
          fontSize: 13.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300
        ),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }
}