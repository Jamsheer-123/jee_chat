import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jee_chat/infastructure/index.dart';

class SearchBox extends StatelessWidget {
  final String placeholder;
  final Widget? prefixIcon;

  final TextEditingController? controller;
  const SearchBox({
    Key? key,
    required this.placeholder,
    this.prefixIcon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
        onTap: () {},
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          prefixIcon: prefixIcon ??
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.search, color: AppColors.backgroundColor),
              ),
          suffixIcon: InkWell(
            onTap: () {
              controller!.text = "";
            },
            child:
                const Icon(Icons.abc_rounded, color: Colors.white70, size: 20),
          ),
          hintText: placeholder,
          hintStyle: GoogleFonts.lato(
              //fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.backgroundColor),
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.backgroundColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.backgroundColor),
          ),
        ),
      ),
    );
  }
}
