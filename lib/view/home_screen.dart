

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/models/news_channels_headlines_model.dart';
import 'package:news_api/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  NewsViewModel newsViewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    final height = MediaQuery.sizeOf(context).height  * 1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Image.asset('images/category_icon.png',height: 30,width: 30,)),
        title: Text('News',style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w700),),
      ),
      body: ListView(
        children: [
            SizedBox(
              height: height * .55,
              width: width,
              child:FutureBuilder<NewsChannelsHeadlinesModel>(
                future: newsViewModel.FetchNewChannelHeadlinesApi(),
                  builder: (BuildContext context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: SpinKitCircle(
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                }else{
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context ,index){
                        return SizedBox(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                                 Container(
                                   height: height * 0.6,
                                   width : width *  .9,
                                   padding: EdgeInsets.symmetric(
                                    horizontal:  height  * .02,
                                   ),
                                   child:
                                   ClipRRect(
                                       borderRadius: BorderRadius.circular(15),
                                   child: CachedNetworkImage(
                                     imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                     fit: BoxFit.cover,
                                     placeholder: (context, url)=> Container(child: SpinKitWave(color: Colors.green,size: 50,),),
                                     errorWidget: (context, url, error)=> Icon(Icons.error_outline,color: Colors.red,),
                                   ),
                                 ),
                                 ),
                            ],
                          ),
                        );
                      }
                  );
                }
            },
            ),
            ),
        ],
      ),
    );
  }
}


// const spinKit2 SpinKitFadingCirlcle(
// color : Colors.amber,
// size : 50,
// );