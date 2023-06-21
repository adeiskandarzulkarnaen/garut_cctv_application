import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:garut_cctv/models/cctv.dart';

class ApiService {
  static const String _baseUrl = 'http://diskominfo.garutkab.go.id/';
  static const String _mod = 'm.services';
  static const String _sub = 'cctv';
  static const String _act = 'view';
  static const String _typ = 'html';
  static const String _limit = '50';
  
  Future<ResponseResult> serverResponse() async {
    final response = await http.get(Uri.parse("${_baseUrl}admin/index.php?mod=$_mod&sub=$_sub&act=$_act&typ=$_typ&limit=$_limit"));
    if (response.statusCode == 200) {
      return ResponseResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}