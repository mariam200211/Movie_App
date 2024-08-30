import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api/api_constatns.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/app_colors.dart';
import 'package:movies_app/model/search.dart';

class SearchTap extends StatefulWidget {

  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
  ScrollController _scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  ApiManager apiManager = ApiManager();
  Search? search;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: MediaQuery.of(context).size.height*0.05,color: Colors.transparent,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CupertinoSearchTextField(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: AppColors.darkGrayColor,
                ),
                controller: searchController,
                prefixIcon: Icon(Icons.search,color: AppColors.whiteColor,),
                suffixIcon: Icon(Icons.cancel_outlined,color: AppColors.whiteColor,),
                style: TextStyle(color: AppColors.greyWritingColor),
                onChanged: (value){
                  if(value.isEmpty)
                    {

                    }
                  else
                    {
                      searchFunction(searchController.text);
                    }
                },
              ),
            ),

            search == null ? const SizedBox.shrink()
                :
            ListView.builder(
              controller: _scrollController,
                shrinkWrap: true,
                itemCount: search?.results?.length,
              itemBuilder: ( context,  index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                    child: Row(
                      children: [
                    search!.results?[index].backdropPath == null
                    ? Image.asset('assets/images/error.png',
                      width:  MediaQuery.of(context).size.width*0.4,)
                        :
                    CachedNetworkImage(
                          imageUrl: "$imageUrl${search!.results?[index].backdropPath}",
                          width:  MediaQuery.of(context).size.width*0.4,),

                        SizedBox(width: MediaQuery.of(context).size.width*0.1, ),
                        SizedBox(
                          width:  MediaQuery.of(context).size.width*0.5,
                          child: Text('${search!.results?[index].originalTitle}',
                            style: Theme.of(context).textTheme.titleSmall,),
                        )
                      ],
                    ),
                  );
                  },
            ),
          ]
        ),
      ),
    );
  }
  @override
  void dispose(){
    searchController.dispose();
    super.dispose();
  //  no memory
  }
  void searchFunction (String query){
    apiManager.getSearchedMovie(query).then((results){
      setState(() {
        search=results;
      });
    });
  }
}
