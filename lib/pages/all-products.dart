import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:myapp/api/productapi.dart';
import 'package:myapp/models/productmodel.dart';
import 'package:myapp/pages/productDetail.dart';
import 'package:myapp/utils.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List<allPoducts>? products;
  ProductAPi productdata = new ProductAPi();

  Future<void> myproducts() async {
    final data = await productdata.fetchproduct();

    setState(() {
      products = data;
    });
  }

  @override
  void initState() {
    myproducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff7f8fa),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 21 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0.36 * fem, 22 * fem),
                    padding: EdgeInsets.fromLTRB(
                        27 * fem, 26.33 * fem, 13.98 * fem, 22 * fem),
                    width: 419.64 * fem,
                    height: 107 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: Color(0xffFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 15 * fem, 12.66 * fem, 0 * fem),
                          child: Text(
                            'All Products',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Open Sans',
                              fontSize: 28 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.3618164062 * ffem / fem,
                              letterSpacing: 0.3600000143 * fem,
                              color: Color(0xff08293b),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            products != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: products!.length,
                      itemBuilder: (context, index) {
                        final product = products![index];

                        return Container(
                          margin: EdgeInsets.fromLTRB(
                              26 * fem, 0 * fem, 26 * fem, 22 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(productId: product.id),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 15.13 * fem),
                                  padding: EdgeInsets.fromLTRB(10.81 * fem,
                                      174 * fem, 20.92 * fem, 10.08 * fem),
                                  width: double.infinity,
                                  height: 216.08 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffd8d8d8),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          product.image.toString()),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 83.6 * fem, 0 * fem),
                                        child: Text(
                                          '${product.price} AED',
                                          style: SafeGoogleFont(
                                            'Open Sans',
                                            fontSize: 22 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.4545454545 * ffem / fem,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(
                                            1, 7 * fem, 0, 6.27 * fem),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  product.rating!.rate!,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 25.0,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 2.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(
                                    0 * fem, 2.79 * fem, 0 * fem, 0 * fem),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 3 * fem),
                                      child: Text(
                                        product.title.toString(),
                                        style: SafeGoogleFont(
                                          'Open Sans',
                                          fontSize: 14 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.5714285714 * ffem / fem,
                                          letterSpacing: 0.174999997 * fem,
                                          fontStyle: FontStyle.italic,
                                          color: Color(0xff444a51),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        product.description.toString(),
                                        style: SafeGoogleFont(
                                          'Open Sans',
                                          fontSize: 10 * ffem,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 0.174999997 * fem,
                                          color: Color(0xff08293b),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Text("Data Loading"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Color(0xffBFC2C8),
        selectedItemColor: Color(0xffBFC2C8),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Icon(Icons.favorite),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
