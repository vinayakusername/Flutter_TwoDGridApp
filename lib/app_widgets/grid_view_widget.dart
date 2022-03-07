import 'package:flutter/material.dart';
import 'package:two_d_grid_app/app_widgets/row_column_form_widget.dart';
import 'package:two_d_grid_app/app_widgets/search_alphabet_widget.dart';


class GridViewPage1 extends StatefulWidget 
{
  int gridRow,gridCol;
  List<String> gridAlphabetList=[];
  GridViewPage1({ Key? key,required this.gridRow,required this.gridCol,required this.gridAlphabetList }) : super(key: key);

  @override
  State<GridViewPage1> createState() => _GridViewPage1State();
}

class _GridViewPage1State extends State<GridViewPage1> 
{
  double padding = 5;
  @override
  Widget build(BuildContext context) 
  {
    Size size = MediaQuery.of(context).size;
    return Scaffold
    (
      appBar: AppBar
      (
        title:Text
        (
          'Flutter GridView',
           style:TextStyle
          (
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        ),
        centerTitle: true,
        actions: 
        [
          Padding
          (
            padding:EdgeInsets.all(8.0),
            child:IconButton
            (
              onPressed:()
              {
                 /*
              showSearch() is method provided by flutter which creates predefine textfield.
              Just we need to pass context and search delegate which is dataSearch in our case.
               */
              showSearch
              (
                context: context, 
                delegate: SearchAlphabet(gridRow: widget.gridRow,gridCol: widget.gridCol,gridAlphabetList:widget.gridAlphabetList)
              );
              }, 
              icon:Icon(Icons.search)
            ),
          ),
           Padding
          (
            padding: EdgeInsets.all(8.0),
            child:IconButton
            (
              onPressed: ()
              {
                 Navigator.pushReplacement
                    (
                      context, 
                      MaterialPageRoute
                      (
                        builder:(context)=>RowColFormPage()
                      )
                    );
              },
              icon: Icon(Icons.clear),
            )
          ),
        ],
      ),
      body: _buildGridView(),
     
    );
  }

  Widget _buildGridView()
  {
    return Center(
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
                itemCount:widget.gridCol * widget.gridRow,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                (  
                    
                    crossAxisCount: widget.gridCol,
                    childAspectRatio:1, 
                    crossAxisSpacing: padding,  
                    mainAxisSpacing: padding  
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
                  child:Center(
                  child: Text
                  (
                  widget.gridAlphabetList[index],
                  style:TextStyle
                  (
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center ,
                  ),
                  ),
                
                ),
                ),  
              ),
            );
  }
}