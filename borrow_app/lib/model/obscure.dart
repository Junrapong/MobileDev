import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Obscure {
  void obs(bool _obscureText) {
    _obscureText = true;
    TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            _obscureText = !_obscureText;
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
