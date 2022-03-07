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

  int rowC=1,colC=1;
  bool _validate = false;

  @override
  void dispose() 
  {
    rowTextEditingController.dispose();
    columnTextEditingController.dispose();
    super.dispose();
  }

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
                         controller: rowTextEditingController,
                         
                         decoration: InputDecoration
                        (
                          labelStyle:TextStyle(color: Colors.orange),
                          labelText: 'Grid view row',
                          hintText: 'Enter number of rows',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          focusedBorder:OutlineInputBorder
                          (
                           borderRadius: BorderRadius.circular(8.0),
                           borderSide: BorderSide
                          (
                            color: Colors.amberAccent,
                            width: 2
                          ),
                          ),
                          enabledBorder: OutlineInputBorder
                          (
                             borderRadius: BorderRadius.circular(8.0),
                             borderSide: BorderSide
                             (
                              color: Colors.blueGrey
                             )
                          ),
                           errorBorder: OutlineInputBorder
                                        (
                                         borderRadius: BorderRadius.circular(8.0),
                                         borderSide: BorderSide
                                         (
                                          color: Colors.redAccent,
                                          width: 2
                                         )
                                        ),
                                       focusedErrorBorder: OutlineInputBorder
                                       (
                                         borderRadius: BorderRadius.circular(8.0),
                                         borderSide: BorderSide
                                        (
                                            color:Colors.redAccent,
                                            width: 2
                                        )
                                       )
                        ),
                     
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
                        controller: columnTextEditingController,
                        decoration: InputDecoration
                        (
                          labelStyle:TextStyle(color: Colors.orange),
                          labelText: 'Grid view column',
                          hintText: 'Enter number of columns',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                          focusedBorder:OutlineInputBorder
                          (
                           borderRadius: BorderRadius.circular(8.0),
                           borderSide: BorderSide
                          (
                            color: Colors.amberAccent,
                            width: 2
                          ),
                          ),
                          enabledBorder: OutlineInputBorder
                          (
                             borderRadius: BorderRadius.circular(8.0),
                             borderSide: BorderSide
                             (
                              color: Colors.blueGrey
                             )
                          ),
                           errorBorder: OutlineInputBorder
                           (
                             borderRadius: BorderRadius.circular(8.0),
                             borderSide: BorderSide
                                      (
                                          color: Colors.redAccent,
                                          width: 2
                                        )
                                      ),
                           focusedErrorBorder: OutlineInputBorder
                             (
                               borderRadius: BorderRadius.circular(8.0),
                               borderSide: BorderSide
                              (
                               color:Colors.redAccent,
                               width: 2
                             )
                             )
                        ),
                       ),
                      ),
           
                   SizedBox(height:10.0),
                   Row
                   (
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: 
                     [
                       Container(
                         width: 100,
                         height: 50,
                         child: ElevatedButton
                         (
                           onPressed: ()
                           {
                            setState(() 
                            {
                            rowTextEditingController.text.isEmpty ? _validate = true : _validate = false;
                            columnTextEditingController.text.isEmpty?_validate =true: _validate = false;
                            });
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
                           
                           }, 
                           child:Text
                                  (
                                     "Submit",
                                     style:TextStyle
                                    (
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          style: ButtonStyle
                                 (
                                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                                  shape: MaterialStateProperty.all
                                  (
                                    RoundedRectangleBorder
                                   (
                                     borderRadius: BorderRadius.circular(10)
                                   )
                                  ),
                                 ), 
                           
                          ),
                       ),
                      
                   SizedBox(width: 20,),
                    Container(
                      width: 100,
                      height: 50,
                      child: ElevatedButton
                      (
                        onPressed: ()
                       {
                         rowTextEditingController.text='';
                         columnTextEditingController.text='';
                          //Navigator.of(context).pop();
                       }, 
                       
                       child: Text
                       (
                         "Reset",
                         style:TextStyle
                         (
                           color: Colors.white,
                           fontSize: 15.0,
                           fontWeight: FontWeight.bold,
                         )
                       ),
                        style: ButtonStyle
                                 (
                                  backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
                                  shape: MaterialStateProperty.all
                                  (
                                    RoundedRectangleBorder
                                   (
                                     borderRadius: BorderRadius.circular(10)
                                   )
                                  ),
                                 ), 
                       ),
                    ),
                     
                    ],
                   ), 
                  ],
              );
  }
}
