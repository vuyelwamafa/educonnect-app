import 'package:flutter/material.dart';
import 'package:flutter_application_1/courses.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/registration.dart';

class RouteManager{
static const String login_page = '/';
static const String registration = '/registration';
static const String courses = '/courses';
static const String profile = '/profile';

static Route<dynamic> generateRoute(RouteSettings settings){
 switch (settings.name){
  case login_page:
  return MaterialPageRoute(builder: (context) => const LoginPage(),
  );
  case registration:
  return MaterialPageRoute(builder: (context) => const Registration(),);
  case courses:
  return MaterialPageRoute(builder: (context) =>  FacultiesPage(),);
      case profile:
  return MaterialPageRoute(builder: (context) => const EditProfilePage(),);


  default:
  throw const FormatException("none of the pages exist");
 } 
}
}