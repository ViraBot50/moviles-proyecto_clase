import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/popular_model.dart';
import 'package:flutter_application_1/network/api_popular.dart';

class ApiPopularScreen extends StatefulWidget {
  const ApiPopularScreen({super.key});

  @override
  State<ApiPopularScreen> createState() => _ApiPopularScreenState();
}

class _ApiPopularScreenState extends State<ApiPopularScreen> {
  ApiPopular? apiPopular;

  @override
  void initState() {
    super.initState();
    apiPopular=ApiPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Popular movie"),),
      body: FutureBuilder(
        future: apiPopular!.getAllPopular(), 
        builder: (context,snapshot){

          if (snapshot.hasData){
            return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
            itemCount: snapshot.data!.length,
            itemBuilder: (context,index){
                return PopularItem(snapshot.data![index]);
              } 
            );
          }
          else {
            if (snapshot.hasError){
              return Center(child: Text("Algo ha salido mal :() ${snapshot.error.toString()}"),);
            }else{
                return Center(child: CircularProgressIndicator(),);
            }
            
          }
        }
        ),

    );
  }

  
  Widget PopularItem(PopularModel pelicula) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: pelicula.posterPath.isNotEmpty
                ? FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: AssetImage("resources/loading1.gif"),
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${pelicula.posterPath}',
                      // fit: BoxFit.cover,
                      // width: double.infinity,
                      // errorBuilder: (context, error, stackTrace) {
                      //   return const Center(child: Icon(Icons.movie, size: 50));
                      // },
                    ),
                )
                : const Center(child: Icon(Icons.movie, size: 50)),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              pelicula.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}