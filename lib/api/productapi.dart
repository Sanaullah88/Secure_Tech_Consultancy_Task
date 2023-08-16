
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myapp/models/productmodel.dart';

class ProductAPi{


Future<List<allPoducts>> fetchproduct() async{

  http.Response response;
  response=await http.get(Uri.parse('https://fakestoreapi.com/products'));

  if(response.statusCode==200){

      final List<dynamic> data = json.decode(response.body);
      return data.map((product) => allPoducts.fromJson(product)).toList();

  }
  else{
    throw (Exception('Product Load Faile'));
  }

}


}