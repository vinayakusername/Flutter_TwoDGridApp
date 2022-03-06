import 'package:flutter/material.dart';
import 'package:two_d_grid_app/app_widgets/alphabet_form_widget.dart';


class RowColFormPage extends StatefulWidget 
{
  const RowColFormPage({ Key? key }) : super(key: key);

  @override
  State<RowColFormPage> createState() => _RowColFormPageState();
}

class _RowColFormPageState extends State<RowColFormPage> 
{
  
  TextEditingController rowTextEditingController = TextEditingController();
  TextEditingController columnTextEditingController = TextEditingController();

  int rowC=0,colC=0; 

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
        centerTitle: true
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm()
  {
    return Column
             (
                children: 
                  [
                      SizedBox(height: 20,),
                      Text
                      (
                        "Row",
                        style: TextStyle
                        (
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight:FontWeight.bold
                        ),
                      ),
                      Padding
                      (
                       padding: const EdgeInsets.all(12.0),
                       child: TextField
                       (
                         decoration: InputDecoration
                        (
                          border: OutlineInputBorder(),
                          hintText: 'Enter number of rows'
                        ),
                      controller: rowTextEditingController,
                       ),
                      ),
                      SizedBox(height: 20,),
                      Text
                      (
                        "Column",
                        style: TextStyle
                        (
                          fontSize: 20,
                          color: Colors.orange,
                          fontWeight:FontWeight.bold
                        ),
                      ),
                      Padding
                      (
                       padding: const EdgeInsets.all(12.0),
                       child: TextField
                       (
                        decoration: InputDecoration
                        (
                         border: OutlineInputBorder(),
                         hintText: 'Enter number of columns'
                        ),   
                        controller: columnTextEditingController,
                       ),
                      ),
           
                   SizedBox(height:10.0),
                   Row
                   (
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: 
                     [
                        FlatButton
                    (
                      onPressed: ()
                     {
                       rowC = int.parse(rowTextEditingController.text);
                       colC = int.parse(columnTextEditingController.text);
                       Navigator.of(context).pop(); 
                       Navigator.of(context).push
                                            (
                                              MaterialPageRoute
                                              (
                                                builder: (context)=>AlphabetFormPage(rowC:rowC,colC:colC)
                                              )
                                            );
                       setState(() 
                       {
      
                       });
                       //Navigator.of(context).pop();
                     }, 
                     child: Container
                     (
                      decoration: BoxDecoration
                     (
                       borderRadius: BorderRadius.circular(15.0),
                       color:Colors.orange
                     ),
                     padding: EdgeInsets.all(20),
                     child: Text
                     (
                       "Submit",
                       style:TextStyle
                       (
                         color: Colors.white
                       ),
                     )
                     ),
                   ),
                   SizedBox(width: 20,),
                    FlatButton
                    (
                      onPressed: ()
                     {
                       rowTextEditingController.text='';
                       columnTextEditingController.text='';
                        //Navigator.of(context).pop();
                     }, 
                     child: Container
                     (
                      decoration: BoxDecoration
                     (
                       borderRadius: BorderRadius.circular(15.0),
                       color:Colors.orange
                     ),
                     padding: EdgeInsets.all(20),
                     child: Text
                     (
                       "Reset",
                       style:TextStyle
                       (
                         color: Colors.white
                       )
                     ),
                     ),
                   ),  
                    ],
                   ), 
                  ],
              );
  }
}
