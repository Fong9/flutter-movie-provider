import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  const AppTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[900],
          prefixIcon: Icon(Icons.search, color: Colors.white,),
          hint: Text('Search', style: TextStyle(color: Colors.grey),),
          border: OutlineInputBorder(
            borderRadius: .circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: .circular(10),
            borderSide: BorderSide(color: Colors.grey)
          )
        ),
      ),
    );
  }
}