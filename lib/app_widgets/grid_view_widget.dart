import 'package:flutter/material.dart';
import 'package:two_d_grid_app/app_widgets/row_column_form_widget.dart';


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
  @override
  Widget build(BuildContext context) 
  {
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
                //functionality to search an item
              }, 
              icon:Icon(Icons.search)
            ),
          )
        ],
      ),
      body: _buildGridView(),
      floatingActionButton: FloatingActionButton
         (
           onPressed:()=>Navigator.of(context).push
                                               (
                                                 MaterialPageRoute
                                                 (
                                                   builder:(context)=>RowColFormPage()
                                                 ),
                                               ),
           child: Icon(Icons.add),
         ),  
    );
  }

  Widget _buildGridView()
  {
    return Center(
          child: Container
          (
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,  
              padding: EdgeInsets.all(12.0),  
              child: GridView.builder
              (  
                itemCount:widget.gridCol * widget.gridRow,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                (  
                    
                    crossAxisCount: widget.gridCol,
                    childAspectRatio:3/2, 
                    crossAxisSpacing: 20.0,  
                    mainAxisSpacing: 20.0  
                ),  
               
                itemBuilder: (context, index) => Container
                (
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