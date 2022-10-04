import 'package:flutter/material.dart';

const _baseUrl = "http://165.22.75.82/";
enum Environment { development, staging, live }
Map<String, dynamic> _config = devConstants;
dynamic get apiBaseUrl {
  return _config[_baseUrl];
}
Map<String, dynamic> devConstants = {
  _baseUrl: "http://165.22.75.82/",
};

Map<String, dynamic> stageConstants = {
  _baseUrl: "http://165.22.75.82/",
};

Map<String, dynamic> prodConstants = {
  _baseUrl: "http://165.22.75.82/",
};

void setEnvironment(Environment env) {
  switch (env) {
    case Environment.development:
      _config = devConstants;
      break;
    case Environment.staging:
      _config = stageConstants;
      break;
    case Environment.live:
      _config = prodConstants;
      break;
  }
}


