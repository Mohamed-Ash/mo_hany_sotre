import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m_hany_store/core/form_fields/button_form_feilds.dart';
import 'package:m_hany_store/core/routes/string_route.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List salePRoducts = [];

  CollectionReference getAllProductSale = FirebaseFirestore.instance.collection('categories');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                fit: BoxFit.cover,
                alignment: Alignment.center,
                image: AssetImage('assets/images/panner.png')
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
               /*  GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2/3,
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context,index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, productPagse);
                      },
                      child: buildCategories(context,index)
                    );
                  } ,
                  itemCount: salePRoducts.length,
                ), */
                Row(
                  children: [
                    Container(
                      width: 180,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: AssetImage('assets/images/steam_gift_codes.jpg') 
                        ),
                      ),
                    ), 
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 180,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: AssetImage('assets/images/valorant.jpg') 
                        ),
                      ),
                    ), 
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, userShippingPage);
                      },
                      child: Container(
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: AssetImage('assets/images/upgrade_gtav.jpg') 
                          ),
                        ),
                      ),
                    ), 
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 180,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          image: AssetImage('assets/images/upgrade_red_dead.jpg') 
                        ),
                      ),
                    ), 
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                 Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, productPagse);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 180,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            image: AssetImage('assets/images/steam_games_offers.jpg') 
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: 180,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              image: AssetImage('assets/images/pubg.jpg') 
                            ),
                          ),
                        ),
                        FormFeilds.containerImage(assetImage: 'assets/images/coming_soon.png',height: 60,width: 60),
                      ],
                    ), 
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /* Future<void> getCategories() async {
    QuerySnapshot responseBody  = await getAllProductSale.get();
    for(var element in responseBody.docs){
      setState(() {
        salePRoducts.add(element.data());
      });
    }
  } */
  
  /* Widget buildCategories(context,index){
    return Container(
      width: 180,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          image: NetworkImage('${salePRoducts[index]['image']}') 
        ),
      ),  
    );
  } */

  /* @override
  void initState() {
    getCategories();
    super.initState();
  } */
  
}