import 'package:flutter/material.dart';
import 'package:food_id/models/food_banner.dart';
import 'package:food_id/provider/banner_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FoodBanner foodBanner = FoodBanner();
  List<BannerData> topBanner = [], smallBanner = [];
  BannerProvider provider = BannerProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getBanner();
  }


  getBanner() async {
    try {
      var response = await provider.get();

      setState(() { 
        foodBanner = response; 
        topBanner = foodBanner.data!.where((element) => element.banner_variant_id == 1).toList();
        smallBanner = foodBanner.data!.where((element) => element.banner_variant_id == 3).toList();
      });
    } catch (e) {
      throw(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FOOD.ID",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[600],
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.chat_outlined
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 150),
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.place_outlined, color: Colors.white,),
                      SizedBox(width: 10,),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Dikirim ke ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.8)
                              ),
                            ),
                            TextSpan(
                              text: " Jakarta Selatan",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ),
                      // SizedBox(width: 5,),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      hintText: "Mau belanja makanan apa?",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.8)
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search, color: Colors.white,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    height: 150
                  ),
                  items: List.generate(topBanner.length, (index) {
                    BannerData data = topBanner[index];
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber
                      ),
                      child: Image.network(
                        data.media!,
                        fit: BoxFit.cover,
                      )
                    );
                  }),
                ),
              ),
              SizedBox(height: 80,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Special di FOOD.ID",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3/1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: smallBanner.length,
                  itemBuilder: (BuildContext context, int index) {
                    BannerData data = smallBanner[index];
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data.media!,
                          fit: BoxFit.cover,
                        ),
                      )
                    );
                  },
                )
              ),
              SizedBox(height: 80,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Special di FOOD.ID",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                child: GridView.custom(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    pattern: const [
                      QuiltedGridTile(1, 1),
                      QuiltedGridTile(1, 2),
                      // QuiltedGridTile(2, 2),
                      // // QuiltedGridTile(1, 2),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      BannerData data = foodBanner.data![index];
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            data.media!,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      );
                    },
                    childCount: foodBanner.data!.length,
                  ), 
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
