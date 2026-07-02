import 'package:flutter/material.dart';
import 'package:flutter_section5/widget/expenses.dart';

void main(){
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    
    home: Expenses(),));
}