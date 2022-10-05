import 'package:flutter/material.dart';
var _baseUrl = "http://165.22.75.82/";
enum Environment { development, staging, live }
String setEnvironment (Environment env) {
  switch (env) {
    case Environment.development:
      return _baseUrl;
      break;
    case Environment.staging:
      return  _baseUrl ;
      break;
    case Environment.live:
      return _baseUrl ;
      break;
  }
}


