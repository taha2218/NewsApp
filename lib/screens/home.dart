import 'package:News_App/helper/data.dart';
import 'package:News_App/models/ArticleModel.dart';
import 'package:News_App/models/CategoryModel.dart';
import 'package:News_App/screens/category.dart';
import 'package:News_App/screens/newsScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../helper/news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> newsArticle = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState(){
    super.initState();
    categories = getCategories();
    getNews();

  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews(); 
    newsArticle = newsClass.news;
    setState(() {
      _loading = false;
    });
    print("Loaded !");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 15,),
          Container(
            height: 80,
            margin: EdgeInsets.fromLTRB(10,0,10,0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context,index){
                return CategoryTile(imageUrl:categories[index].imageUrl ,categoryName:categories[index].categoryName,);
              }
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child:Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(6, 6, 6, 1),
                borderRadius: BorderRadius.circular(18)
              ),
              padding: EdgeInsets.fromLTRB(15,16,15,15),
              child:_loading? Center(child: CircularProgressIndicator(),) :ListView.builder(
                itemCount: newsArticle.length,
                shrinkWrap: true,
                itemBuilder: (ctx,index){
                  return NewsTile(imageUrl: newsArticle[index].urlToImage,description:newsArticle[index].description,title:newsArticle[index].title,url:newsArticle[index].url,);
                },
                ),
            ),
          )
        ],
      ) 
    );
  }
}


class CategoryTile extends StatelessWidget {

  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          print("Tapped !");
          Navigator.push(context, MaterialPageRoute(
            builder:(ctx)=>Category(
              category: categoryName.toLowerCase(),
            )
          ));
        },
        child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
        child:Stack(
          children: <Widget>[
            CachedNetworkImage(imageUrl:imageUrl ,height: 80,width: 140,fit: BoxFit.cover,),
            Container(
              height: 80,
              width: 140,
              color: Color.fromRGBO(0, 0, 0, 0.3),
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class NewsTile extends StatelessWidget {

  final String imageUrl, title, description,url;

  NewsTile({this.imageUrl,this.title,this.description,this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder:(context)=>NewsScreen(url: url,)
            ));
          
        },
        child: Container(
        margin: EdgeInsets.only(bottom:14),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Image.network(imageUrl,height: 170,width: double.infinity,fit: BoxFit.cover,),
            Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                color: Colors.red[400]
              ),
              child: SizedBox(height: 3,width: double.infinity,),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 12, 8, 6),
              color: Color.fromRGBO(255, 255, 255, 0.08),
              child: Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8,0, 8, 12),
              color: Color.fromRGBO(255, 255, 255, 0.08),
              child: Text(description,
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 13
                ),
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}