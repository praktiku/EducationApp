import 'package:crypto/crypto.dart';
import 'dart:convert';

String encryptPassword(String password) {
  final bytes = utf8.encode(password);
  final hash = sha256.convert(bytes);
  return hash.toString();
}
