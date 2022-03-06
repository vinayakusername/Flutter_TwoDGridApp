import 'package:flutter/material.dart';
import 'package:two_d_grid_app/app_widgets/grid_view_widget.dart';


class AlphabetFormPage extends StatefulWidget 
{
  int rowC,colC;
  AlphabetFormPage({ Key? key,required this.rowC,required this.colC }) : super(key: key);

  @override
  State<AlphabetFormPage> createState() => _AlphabetFormPageState();
}

class _AlphabetFormPageState extends State<AlphabetFormPage> 
{
  TextEditingController strTextEditingController = TextEditingController();

  String strAlphabet =''; 
  List<String> alphabetList=[];

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
      body: _buildAlphabetForm(),
    );
  }

  Widget _buildAlphabetForm()
  {
    return Container
         (
           width: MediaQuery.of(context).size.width,
           height:MediaQuery.of(context).size.height,
           child: Column
             (
                children: 
                    [
                      Padding
                      (
                       padding: const EdgeInsets.all(12.0),
                       child: TextField
                       (
                         decoration: InputDecoration
                        (
                          border: OutlineInputBorder(),
                          hintText: 'Enter Alphabets'
                        ),
                       controller: strTextEditingController,
                       maxLength:widget.rowC*widget.colC,
                       textCapitalization:TextCapitalization.characters,
                       ),
                      ),
                     SizedBox(height:10.0),
                     FlatButton
              (
                  onPressed: ()
                  {
                   Navigator.of(context).pop(); 
                   print(strAlphabet = strTextEditingController.text);
                   alphabetList = strAlphabet.split('');
                   Navigator.of(context).push
                                         (
                                           MaterialPageRoute
                                            (
                                              builder: (context)=> GridViewPage1
                                                                  (
                                                                    gridRow:widget.rowC,
                                                                    gridCol:widget.colC,
                                                                    gridAlphabetList:alphabetList,
                                                                  )
                                            ),
                                         );
                   
                   print(alphabetList);//printing list of values on console
                   setState(() 
                   {
                    strTextEditingController.text = '';
                   });
                   
                  }, 
               child: Container
               (
                decoration: BoxDecoration
                (
                  borderRadius: BorderRadius.circular(15.0),
                  color:Colors.orange
                ),
                padding: EdgeInsets.all(20),
                child: Text("Submit")
               ),
              ), 
                    ],
              ),
         );
  }
}