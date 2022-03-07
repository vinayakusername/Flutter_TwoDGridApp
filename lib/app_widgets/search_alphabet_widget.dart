import 'package:flutter/material.dart';

class SearchAlphabet extends SearchDelegate<String>
{
  int gridRow,gridCol;
  List<String> gridAlphabetList =[];
  SearchAlphabet({required this.gridRow,required this.gridCol, required this.gridAlphabetList});
 
   @override
  List<Widget> buildActions(BuildContext context) 
  {
     //actions for app bar
    // TODO: implement buildActions
    return
    [
      IconButton
      (
        onPressed: ()
        {
          query ='';
        }, 
        icon:Icon(Icons.clear)
      ),
    ];


    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) 
  {
     //leading icon on the left side of the app bar
    // TODO: implement buildLeading
    return IconButton
    (
      onPressed: ()
      {
        close(context,'');
      }, 
      icon: AnimatedIcon
      (
        icon: AnimatedIcons.menu_arrow, 
        progress: transitionAnimation,
      ),
    );
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) 
  {
    //show some results based on search item selected
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) 
  {
     //show search related suggestion when someone searches something 
    // TODO: implement buildSuggestions
   //throw UnimplementedError();
   /*
         suggestionList is reference variable of list.
         query is variable which contain input text enter by user while searching an element.
    */

     final suggestionList = gridAlphabetList;

    // final suggestionList = query.isEmpty? recentAlphabetSearch : alphabet.where
    //                                                                    (
    //                                                                      (element) => element.startsWith
    //                                                                                           (query)
    //                                                                    ).toList();  

    
   return Center
   (
      child: Container
          (
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,  
              color: Colors.redAccent,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5.0), 
              margin: EdgeInsets.all(5.0), 
              child: GridView.builder
              (  
                itemCount:gridAlphabetList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                (  
                    
                    crossAxisCount: gridCol,
                    childAspectRatio:1, 
                    crossAxisSpacing:5.0,  
                    mainAxisSpacing: 5.0  
                ),  
               
                itemBuilder: (context, index) => Container
                (
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration
                  (
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child:Center
                    (
                      child: RichText
                      (
                        text: TextSpan
                        (
                          text:suggestionList[index].substring(0,query.length),
                          style: TextStyle
                          (
                            fontSize: 35.0,
                            color:Colors.black,
                            fontWeight: FontWeight.bold
                          ),
                          children: 
                          [
                            TextSpan
                            (
                              text:suggestionList[index].substring(query.length),
                              style:TextStyle(color:Colors.white)
                            )
                          ]
                        )
                      ),
                    ),
                  
                ),
              ),
              ),
              );
  }

  
}