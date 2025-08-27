import 'package:flutter/material.dart';
import 'package:shooping_app/widgets/feature_product.dart';
import 'package:shooping_app/widgets/hot_offers.dart';
import 'package:shooping_app/widgets/product_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Our products'),
      ),
      body:
          SingleChildScrollView(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[ 
                Center(child: Text('Featured Products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 200,
                  child: PageView(
                    
                    controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    FeatureProduct(imagePath: 'assets/images/premium_laptop.jpg', data: 'Premium laptop',),
                    FeatureProduct(imagePath: 'assets/images/prof_workspace.jpg', data: ' professional work space',),
                    FeatureProduct(imagePath: 'assets/images/ligting.jpg', data: 'Ambient lighting',),  
                  ],
                              ),
                ),
                  const SizedBox(height: 20,),
                  Center(
                    child: SmoothPageIndicator(controller: _pageController, count: 3,
                    effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                                    
                    ),
                  ),
                  const SizedBox(height: 20,),
                Center(child: Text('Shop our Products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                const SizedBox(height: 10,),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: EdgeInsets.all(10),
                  children: [
                    ProductCard(imagePath: 'assets/images/premium_laptop.jpg', title: 'Premium laptop', price: r'$999.99 ',),
                    ProductCard(imagePath: 'assets/images/prof_workspace.jpg', title: ' Headphones', price: r'&199.99 ',),
                    ProductCard(imagePath: 'assets/images/ligting.jpg', title: 'Ambient lighting', price: r'$49.99',),
                    ProductCard(imagePath: 'assets/images/shopping.jpg', title: ' chair', price: r'$149.99 ',),
                    ProductCard(imagePath: 'assets/images/ligting.jpg', title: 'Ambient lighting', price: r'$49.99',),
                    ProductCard(imagePath: 'assets/images/shopping.jpg', title: ' chair', price: r'$149.99 ',),
                            
                  ],
                ),
                SizedBox(height: 10,),
                HotOffers()
                
                
                ],
            ),
          )
          );
        
      
  
  }
}