//import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:yemeni_kitchen/viewmodels/recipe_viewmodel_ar.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'dart:io' show Platform;

//import 'package:ads/ads.dart';

class HomePageAr extends StatefulWidget {
  HomePageAr({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HomePageState createState() => new HomePageState();

}


_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class HomePageState extends State<HomePageAr> {
  TextEditingController editingController = TextEditingController();
 /* Ads appAds;
  int _coins = 0;

  final String appId = Platform.isAndroid
      ? 'ca-app-pub-1094342077515771~1626132279'
      : 'ca-app-pub-1094342077515771~1626132279';

  final String bannerUnitId = Platform.isAndroid
      ? 'ca-app-pub-1094342077515771/3742014320'
      : 'ca-app-pub-1094342077515771/3742014320';

  final String screenUnitId = Platform.isAndroid
      ? 'ca-app-pub-1094342077515771/2747642258'
      : 'ca-app-pub-1094342077515771/2747642258';

  final String videoUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';*/

  bool displayText;
  bool selectedIngredients;
  bool selectedInstructions;
  bool selectedInfo;
  bool selectedVideo;

  @override
  void initState() {

    displayText = true;
    selectedIngredients = false;
    selectedInstructions = false;
    selectedInfo = false;
    selectedVideo = false;

    super.initState();
  /*  appAds = Ads(
      appId,
      bannerUnitId: bannerUnitId,
      screenUnitId: screenUnitId,
      keywords: <String>['ibm', 'computers'],
      contentUrl: 'http://www.ibm.com',
      childDirected: false,
      // testDevices: ['1ADC12C31E92846D6F312828AE8B6249'],
      testing: true,

    );*/
    //appAds.showBannerAd();
  }

  @override
  void dispose() {
  //  appAds.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Material(
            child: SafeArea(
                child: Stack(fit: StackFit.expand, children: <Widget>[
                  InkWell(
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 200),
                        child: Container(
                          key: ValueKey<int>(RecipeViewModelAr.selected.id),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2), BlendMode.dstOut),
                                image:
                                AssetImage('assets/' + RecipeViewModelAr.selected.image),
                                fit: BoxFit.cover,
                              )),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height / 6 + 18.0,
                                  left: 7.0,
                                  right:
                                  (MediaQuery.of(context).size.width / 6) - 16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  AnimatedOpacity(
                                      opacity: displayText ? 1.0 : 0.0,
                                      duration: Duration(milliseconds: 200),
                                      child: Text(RecipeViewModelAr.selected.title,
                                          maxLines: 2,
                                          textDirection: TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold))),
                                  AnimatedOpacity(
                                      opacity: displayText ? 1.0 : 0.0,
                                      duration: Duration(milliseconds: 200),
                                      child: Padding(
                                          padding: EdgeInsets.only(top: 2.0),
                                          child: Text(
                                              RecipeViewModelAr.selected.description,
                                              maxLines: 3,
                                              textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.right,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold))))
                                ],
                              )),
                        )),
                    onTap: () {
                      //appAds.showFullScreenAd(state: this);
                      if (!displayText) {
                        setState(() {
                          displayText = true;
                          selectedIngredients = false;
                          selectedInstructions = false;
                          selectedInfo = false;
                          selectedVideo = false;
                        });
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        frostedRound(TextField(
                            cursorColor: Colors.white,

                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                fillColor: Colors.white.withOpacity(0.3),
                                border: InputBorder.none,
                                hintText: "بحث",
                                filled: true,
                                contentPadding: EdgeInsets.only(top: 12.0),
                                prefixIcon: Icon(Icons.search)))),
                        Spacer(),
                        Padding(
                            padding: EdgeInsets.only(bottom: 16.0),
                            child: frostedIconButton(IconButton(
                              icon: Icon(Icons.restaurant_menu,
                                  color: selectedIngredients
                                      ? Colors.white
                                      : Colors.white70),
                              onPressed: () {
                              //  appAds.showFullScreenAd(state: this);
                                setState(() {
                                  if (displayText) {
                                    displayText = false;
                                  }
                                  if (selectedIngredients) {
                                    displayText = true;
                                    selectedIngredients = false;
                                  } else {
                                    selectedIngredients = true;
                                    selectedInstructions = false;
                                    selectedInfo = false;
                                    selectedVideo = false;
                                  }
                                });
                              },
                            ))),
                        frostedIconButton(IconButton(
                          icon: Icon(Icons.list,
                              color:
                              selectedInstructions ? Colors.white : Colors.white70),
                          onPressed: () {
                           // appAds.showFullScreenAd(state: this);
                            setState(() {
                              if (displayText) {
                                displayText = false;
                              }
                              if (selectedInstructions) {
                                displayText = true;
                                selectedInstructions = false;
                              } else {
                                selectedIngredients = false;
                                selectedInstructions = true;
                                selectedInfo = false;
                                selectedVideo = false;
                              }
                            });
                          },
                        )),
                        Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: frostedIconButton(IconButton(
                                icon: Icon(Icons.video_label,
                                    color: selectedVideo ? Colors.white : Colors.white70),
                                onPressed: () async {
                                  String url = RecipeViewModelAr.selected.sourceUrl;
                                  if(await canLaunch(url))
                                    await launch(url);
                                  print(RecipeViewModelAr.selected.sourceUrl);
                                }

                            ))),
                        Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: frostedIconButton(IconButton(
                              icon: Icon(Icons.info_outline,
                                  color: selectedInfo ? Colors.white : Colors.white70),
                              onPressed: () {
                             //   appAds.showFullScreenAd(state: this);
                                setState(() {
                                  if (displayText) {
                                    displayText = false;
                                  }
                                  if (selectedInfo) {
                                    displayText = true;
                                    selectedInfo = false;
                                  } else {
                                    selectedIngredients = false;
                                    selectedInstructions = false;
                                    selectedInfo = true;
                                  }
                                });
                              },
                            ))),
                        Spacer(),

                        Container(
                          height: MediaQuery.of(context).size.height / 5.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: RecipeViewModelAr.recipes.length,
                            itemBuilder: (context, index) {
                              return recipeCard(context, index);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: selectedIngredients
                          ? listCard(context, 'المكونات',
                          RecipeViewModelAr.selected.ingredients)
                          : Container(height: 0, width: 0)),
                  AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: selectedInstructions
                          ? listCard(context, 'طريقة التحضير',
                        RecipeViewModelAr.selected.instructions, )
                          : Container(height: 0, width: 0)),
                  AnimatedSwitcher(
                      duration: Duration(milliseconds: 200),
                      child: selectedInfo
                          ? infoCard(context, 'معلومات غذائية')
                          : Container(height: 0, width: 0)),
                ]))));
  }

  Widget frostedRound(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget frostedIconButton(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: child)));
  }

  Widget frostedEdged(Widget child) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: child));
  }

  Widget listCard(BuildContext context, String title, List<String> list) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.white.withOpacity(0.3),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
                  child: Text(
                    title,
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Divider(color: Colors.white70)),
              Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                          padding: EdgeInsets.all(16.0), child: Text(list[index]));
                    },
                  ))
            ])));
  }

  Widget infoCard(BuildContext context, String title) {
    return frostedEdged(Container(
        key: ValueKey<String>(title),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.white.withOpacity(0.3),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(color: Colors.white70)),
              Expanded(
                  child: ListView(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Center(
                            child: Text("الوقت المتوقع للطبخ  " +
                                RecipeViewModelAr.selected.readyInMinutes.toString() +
                                " دقيقة"))),
                    Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Center(
                            child: Text("لعدد " +
                                RecipeViewModelAr.selected.servings.toString()+ " شخص"))),
                    Padding(padding: EdgeInsets.only(bottom: 8.0), child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "فيجان       ",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RecipeViewModelAr.selected.vegan
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          ),
                          Text(
                            "نباتي",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RecipeViewModelAr.selected.vegetarian
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          )
                        ])),
                    Padding(padding: EdgeInsets.only(bottom: 8.0), child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "خالي من الحليب  ",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RecipeViewModelAr.selected.dairyFree
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          ),
                          Text(
                            "   بدون الجلاتين",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          Icon(
                            RecipeViewModelAr.selected.glutenFree
                                ? Icons.check
                                : Icons.close,
                            size: 14.0,
                          )
                        ])),
                    Text(RecipeViewModelAr.selected.description,
                        textAlign: TextAlign.right ),
                  ])),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    child: Icon(Icons.favorite_border),
                    onTap: () {
                    //  appAds.showFullScreenAd(state: this);
                      //add to favourites
                    },
                  ),
                  InkWell(
                    child: Icon(Icons.launch),
                    onTap: () async {
                      String url = RecipeViewModelAr.selected.sourceUrl;
                      if(await canLaunch(url))
                        await launch(url);
                      print(RecipeViewModelAr.selected.sourceUrl);
                    },
                  )
                ],
              )
            ],
          ),
        )));
  }

  Widget recipeCard(BuildContext context, int index) {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.only(right: 16.0, top: 32.0),
          child: frostedEdged(Container(
              width: MediaQuery.of(context).size.width / 1.5,
              color: Colors.white.withOpacity(0.3),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(9.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height: MediaQuery.of(context).size.width / 5,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/' +
                                              RecipeViewModelAr
                                                  .recipes[index].image)))),
                            ])),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              width:
                              (MediaQuery.of(context).size.width / 3.5),
                              child: Text(RecipeViewModelAr.recipes[index].title,
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.schedule,
                                color: Colors.white70,
                                size: 14.0,
                              ),
                              Text(
                                RecipeViewModelAr.recipes[index].readyInMinutes
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.0,
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(right: 8.0)),
                              Icon(
                                Icons.restaurant,
                                color: Colors.white70,
                                size: 14.0,
                              ),
                              Text(
                                  RecipeViewModelAr.recipes[index].servings
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(right: 8.0)),
                              Icon(
                                Icons.thumb_up,
                                color: Colors.white70,
                                size: 14.0,
                              ),
                              Text(
                                  RecipeViewModelAr.recipes[index].likes
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                  )),
                            ],
                          )
                        ])
                  ])))),
      onTap: () {
       // appAds.showFullScreenAd(state: this);
        setState(() {
          RecipeViewModelAr.selected = RecipeViewModelAr.recipes[index];
        });
      },
    );
  }
}
