import 'package:News_App/helper/news.dart';
import 'package:News_App/models/ArticleModel.dart';
import 'package:flutter/material.dart';
import 'newsScreen.dart';



class Category extends StatefulWidget {

  final String category;
  Category({this.category});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<ArticleModel> newsArticle = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState(){
    super.initState();

    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category); 
    newsArticle = newsClass.news;
    setState(() {
      _loading = false;
    });
    print("Loaded !");
    print(newsArticle.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toString().toUpperCase(),style: TextStyle(fontSize: 16),),
        backgroundColor: Colors.red[900],
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
            child:Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(6, 6, 6, 1),
                //borderRadius: BorderRadius.circular(18)
              ),
              padding: EdgeInsets.fromLTRB(15,16,15,15),
              child:_loading ? Center(child: CircularProgressIndicator(),) : ListView.builder(
                itemCount: newsArticle.length,
                shrinkWrap: true,
                itemBuilder: (ctx,index){
                  return NewsTile(imageUrl: newsArticle[index].urlToImage,description:newsArticle[index].description,title:newsArticle[index].title,url:newsArticle[index].url,);
                },
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