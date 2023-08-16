import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/pages/all-products.dart';
import 'package:myapp/utils.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
class DetailPage extends StatefulWidget {
  final int? productId;

  DetailPage({required this.productId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic>? productData;
  Future<void> fetchProductData() async {
    final response = await http.get(Uri.parse(
        'https://fakestoreapi.com/products/${widget.productId}'));

    if (response.statusCode == 200) {
      setState(() {
        productData = json.decode(response.body);
            print(productData);

      });
    } else {
      print('Error fetching product data: ${response.statusCode}');
    }
  }
  
  @override
  void initState() {
    super.initState();
    fetchProductData();
    print(widget.productId);
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: 
            productData!=null
?
      Container(
        width: double.infinity,
        child: Container(
          width: double.infinity,
          height: 896 * fem,
          decoration: BoxDecoration(
            color: Color(0xfff7f8fa),
            boxShadow: [
              BoxShadow(
                color: Color(0x3f000000),
                offset: Offset(0 * fem, 4 * fem),
                blurRadius: 2 * fem,
              ),
            ],
          ),
          child: Stack(
            children: [
        MediaQuery(
  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
  child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xff979797)),
      color: const Color(0xffd8d8d8),
      image: DecorationImage(
        fit: BoxFit.contain, 
        image: NetworkImage(productData!['image'].toString()),
      ),
    ),
  ),
),
              Positioned(
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
  padding: EdgeInsets.fromLTRB(2 * fem, 14.33 * fem, 2 * fem, 219.46 * fem),
  width: 403.85 * fem,
  height: 874.46 * fem,
 


                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              7 * fem, 0 * fem, 0 * fem, 15 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffFFFFFF),
                                ),
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 306 * fem, 0 * fem),
                                width: 40 * fem,
                                height: 40 * fem,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AllProduct(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.more_vert,
                                  ),
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              7 * fem, 0 * fem, 0 * fem, 475 * fem),
                          child: Text(
                            'Details ',
                            style: SafeGoogleFont(
                              'Open Sans',
                              fontSize: 28 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.3618164062 * ffem / fem,
                              letterSpacing: 0.3600000143 * fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              20 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: Text(
                                                                '${ productData!['price'].toString()} AED',

                           
                            style: SafeGoogleFont(
                              'Open Sans',
                              fontSize: 32 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.09375 * ffem / fem,
                              letterSpacing: 0.400000006 * fem,
                              color: Color(0xff2a3f4b),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0 * fem,
                top: 655 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      14 * fem, 10 * fem, 8.97 * fem, 6.62 * fem),
                  width: 403.85 * fem,
                  height: 240.62 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 5.96 * fem, 14.3 * fem),
                          width: 12.92 * fem,
                          height: 6.46 * fem,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.transparent,
                              elevation: 0,
                            ),
                            child: Image.asset(
                              'assets/images/shape.png',
                              width: 12.92 * fem,
                              height: 6.46 * fem,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 6 * fem, 14.48 * fem),
                          width: double.infinity,
                          height: 54.76 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 39.17 * fem, 0 * fem),
                                width: 55.95 * fem,
                                height: 54.76 * fem,
                                child: IconButton(
                                  icon: const Icon(Icons.file_upload_outlined),
                                  color: Colors.blue,
                                  iconSize: 30,
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                width: 279.76 * fem,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff2ab3c6),
                                  borderRadius: BorderRadius.circular(43 * fem),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Order Now',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Open Sans',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.6666666667 * ffem / fem,
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              6 * fem, 0 * fem, 0 * fem, 0 * fem),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                child: Text(
                                  'Description',
                                  style: SafeGoogleFont(
                                    'Open Sans',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.3618164062 * ffem / fem,
                                    letterSpacing: 0.5 * fem,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xff444a51),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 374.88 * fem,
                                ),
                                child: Text(
                                productData!['description'],
                                  style: SafeGoogleFont(
                                    'Open Sans',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5714285714 * ffem / fem,
                                    letterSpacing: 0.174999997 * fem,
                                    color: Color(0xff828395),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 10.26 * fem, 10 * fem),
                          padding: EdgeInsets.fromLTRB(
                              4 * fem, 5.24 * fem, 30.53 * fem, 5.24 * fem),
                          width: double.infinity,
                          height: 98 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xfff1f1f1),
                            borderRadius: BorderRadius.circular(8 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 5 * fem, 16.76 * fem),
                                width: 113 * fem,
                                height: 200.76 * fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0 * fem,
                                      top: 0 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 113 * fem,
                                          height: 31 * fem,
                                          child: Text(
                                            productData!['rating']['count'].toString(),
                                            style: SafeGoogleFont(
                                              'Open Sans',
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.3618164062 * ffem / fem,
                                              letterSpacing: 0.5 * fem,
                                              color: Color(0xff444a51),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 17 * fem,
                                      top: 30.7619018555 * fem,
                                      child: Align(
                                        child: SizedBox(
                                          width: 71 * fem,
                                          height: 40 * fem,
                                          child: Text(
                                                                                         productData!['rating']['rate'].toString(),

                                            style: SafeGoogleFont(
                                              'Open Sans',
                                              fontSize: 32 * ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.3618164062 * ffem / fem,
                                              letterSpacing: 0.5 * fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10 * fem,
                                    10.76 * fem, 0 * fem, 24.03 * fem),
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          20 * fem, 30.06 * fem, 0 * fem),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                       children: [
                                        RatingBar.builder(
        initialRating: productData!['rating']['rate'],
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 25.0,
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        onRatingUpdate: (rating) {
        },
      ),
                                       ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ):Center(child: Text("Loading Data"),),
    
    
    
    );
  }
}
