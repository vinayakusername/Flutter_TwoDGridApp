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
  
  bool _validate = false;

  @override
  void dispose() 
  {
    strTextEditingController.dispose();
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
                       padding: const EdgeInsets.fromLTRB(12.0,20.0,12.0,12.0),
                       child: TextField
                       (
                        controller: strTextEditingController,
                        maxLength:widget.rowC*widget.colC,
                        textCapitalization:TextCapitalization.characters,
                        decoration: InputDecoration
                        (
                          labelStyle:TextStyle(color: Colors.orange),
                          labelText: 'Alphabets',
                          hintText: 'Enter alphabets',
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
                             ),
                        ),
                       ),
                      ),
                     SizedBox(height:10.0),
              Container(
                width: 100,
                height: 50,
                child: ElevatedButton
                   (
                    onPressed: ()
                    {
                     setState(() 
                     {
                       strTextEditingController.text.isEmpty ? _validate = true : _validate = false;
                     });
                      
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
                    
                    }, 
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0,bottom: 16.0),
                    child: Text
                    (
                      "Submit",
                      style:TextStyle
                      (
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      )
                     
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
                          ))
                      ),
                  
                 
                ),
              ), 
                    ],
              ),
         );
  }
}