import 'package:cloture/screens/home/men/categories_men.dart';
import 'package:cloture/utilities/shimmers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloture/gen/assets.gen.dart';
import 'package:cloture/utilities/colors.dart';
import 'package:cloture/utilities/text.dart';

class HomePageMen extends StatefulWidget {
  const HomePageMen({super.key});

  @override
  State<HomePageMen> createState() => _HomePageMenState();
}

class _HomePageMenState extends State<HomePageMen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List to hold categories and products
  List<Map<String, String>> categories = [];
  List<Map<String, String>> products = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
    fetchProducts();
  }

  // Fetch categories from Firestore
  Future<void> fetchCategories() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('categories').get();
      List<Map<String, String>> fetchedCategories =
          querySnapshot.docs.map((doc) {
        return {
          'name': doc['name'] as String,
          'imageUrl': doc['imageUrl'] as String,
        };
      }).toList();
      if (mounted) {
        setState(() {
          categories = fetchedCategories;
        });
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  // Fetch products from Firestore
  Future<void> fetchProducts() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('products').get();
      List<Map<String, String>> fetchedProducts = querySnapshot.docs.map((doc) {
        return {
          'name': doc['name'] as String,
          'price': doc['price'] as String,
          'imageUrl': doc['imageUrl'] as String,
        };
      }).toList();
      if (mounted) {
        setState(() {
          products = fetchedProducts;
        });
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: TextField(
                cursorColor: primary200,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: black100,
                  ),
                  prefixIcon: Assets.images.searchnormal1
                      .image(height: 16.h, width: 16.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: bgLight2,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reusableText(
                    'Categories',
                    16.sp,
                    FontWeight.bold,
                    black100,
                    -0.41,
                    TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CategoriesMen()));
                    },
                    child: reusableText(
                      'See All',
                      16.sp,
                      FontWeight.w500,
                      black100,
                      -0.41,
                      TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Categories List with shimmer effect
            SizedBox(
              height: 120.h,
              child: categories.isEmpty
                  ? categoriesShimmerEffect()
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        String categoryName = categories[index]['name']!;
                        String imageUrl = categories[index]['imageUrl']!;

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: bgLight2,
                                radius: 40.r,
                                backgroundImage: NetworkImage(imageUrl),
                              ),
                              SizedBox(height: 8.h),
                              reusableText(
                                categoryName,
                                12.sp,
                                FontWeight.w500,
                                black100,
                                -0.41,
                                TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reusableText(
                    'Top Selling',
                    16.sp,
                    FontWeight.bold,
                    black100,
                    -0.41,
                    TextAlign.left,
                  ),
                  reusableText(
                    'See All',
                    16.sp,
                    FontWeight.w500,
                    black100,
                    -0.41,
                    TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Products List with shimmer effect
            SizedBox(
              height: 300.h,
              child: products.isEmpty
                  ? buildProductShimmerEffect() // Call shimmer effect for products
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final String productName = product['name']!;
                        final String productPrice = product['price']!;
                        final String productImage = product['imageUrl']!;

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Stack(
                            children: [
                              // Background Container with Product Info
                              Container(
                                height: 300.h,
                                width: 220.w,
                                decoration: BoxDecoration(
                                  color: bgLight2,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product Image
                                    Container(
                                      height: 220.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.r),
                                          topRight: Radius.circular(8.r),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(productImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          reusableText(
                                            productName,
                                            14.sp,
                                            FontWeight.w500,
                                            black100,
                                            0,
                                            TextAlign.start,
                                          ),
                                          SizedBox(height: 8.h),
                                          reusableText(
                                            '\$ $productPrice',
                                            14.sp,
                                            FontWeight.w900,
                                            black100,
                                            0,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Love Icon Positioned at the top-right corner
                              Positioned(
                                top: 9.h,
                                right: 12.w,
                                child: Assets.images.loveIcon
                                    .image(height: 24.h, width: 24.w),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  reusableText(
                    'New In',
                    16.sp,
                    FontWeight.bold,
                    primary200,
                    -0.41,
                    TextAlign.left,
                  ),
                  reusableText(
                    'See All',
                    16.sp,
                    FontWeight.w500,
                    black100,
                    -0.41,
                    TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 300.h,
              child: products.isEmpty
                  ? buildProductShimmerEffect() // Call shimmer effect for products
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final String productName = product['name']!;
                        final String productPrice = product['price']!;
                        final String productImage = product['imageUrl']!;

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Stack(
                            children: [
                              // Background Container with Product Info
                              Container(
                                height: 300.h,
                                width: 220.w,
                                decoration: BoxDecoration(
                                  color: bgLight2,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product Image
                                    Container(
                                      height: 220.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8.r),
                                          topRight: Radius.circular(8.r),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(productImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          reusableText(
                                            productName,
                                            14.sp,
                                            FontWeight.w500,
                                            black100,
                                            0,
                                            TextAlign.start,
                                          ),
                                          SizedBox(height: 8.h),
                                          reusableText(
                                            '\$ $productPrice',
                                            14.sp,
                                            FontWeight.w900,
                                            black100,
                                            0,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Love Icon Positioned at the top-right corner
                              Positioned(
                                top: 9.h,
                                right: 12.w,
                                child: Assets.images.loveIcon
                                    .image(height: 24.h, width: 24.w),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }
}
