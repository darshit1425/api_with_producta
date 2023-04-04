import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/product_provider.dart';

class Product_Screen extends StatefulWidget {
  const Product_Screen({Key? key}) : super(key: key);

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
  Api_Provider? ProviderT;
  Api_Provider? ProviderF;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Api_Provider>(context, listen: false).ProductApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProviderT = Provider.of<Api_Provider>(context, listen: true);
    ProviderF = Provider.of<Api_Provider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 2.0),
                blurRadius: 4.0,
              )
            ]),
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.black,
              centerTitle: true,
              leading: Icon(Icons.search),
              actions: [Icon(Icons.store)],
              title: Text(
                "All product",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     ProviderF!.ProductApiCall();
            //   },
            //   style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            //   child: Text("Show Product",style: TextStyle(color: Colors.black),),
            // ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${ProviderT!.ProductList[index].title}",
                      style: TextStyle(color: Colors.white),
                    ),
                    // leading: CircleAvatar(
                    //   radius: 70,
                    //   // minRadius: 50,
                    //   // maxRadius: 100,
                    //   backgroundImage: NetworkImage(2
                    //       "${ProviderT!.ProductList[index].image}"),
                    // ),
                    leading: Container(
                      height: 300,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.blueAccent, width: 2),
                      ),
                      child: Image.network(

                        "${ProviderT!.ProductList[index].image}",
                        fit: BoxFit.contain,

                      ),
                    ),

                    subtitle: Text(
                      "${ProviderT!.ProductList[index].price}",
                      style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w700),
                    ),
                    trailing: Text(
                      "${ProviderT!.ProductList[index].id}",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  );
                },
                itemCount: ProviderF!.ProductList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
