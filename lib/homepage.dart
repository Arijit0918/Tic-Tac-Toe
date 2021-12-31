import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool Turn=true;
  int Oscore=0, Xscore=0;
  int filled=0;
  List<String> XorO =['','','','','','','','',''];

  var myTextStyle = TextStyle(color: Colors.white,fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[900],
       body: Column(
         children: <Widget>[
           Expanded(
             child: Container(
             child: Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.all(30.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('Player X',style: myTextStyle,),
                         Text(Xscore.toString(),style: myTextStyle,),
                       ],
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(30.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('Player O',style: myTextStyle,),
                         Text(Oscore.toString(),style: myTextStyle,),
                       ],
                     ),
                   ),
                 ],
               )
             ),
           ),
           ),
           Expanded(
             flex: 3,
           child: GridView.builder(
           itemCount :9,
           gridDelegate: 
           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context,int index)
            {
              return GestureDetector(
                onTap: (){
                  tapped(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800)
                  ),
                  child: Center(
                    child: Text(
                      XorO[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40),
                        ),
                  ),
                ),
              );
            }),
       ),
    Expanded(
      child: Container( 
      ),
    ),
    ],
  ),
 );
}

  void tapped(int index){
  setState(() {
     if(Turn && XorO[index] == ''){
      XorO[index] ='O'; 
      filled+=1;
     }
     else if(!Turn && XorO[index] == '') 
     {
       XorO[index]='X';
       filled+=1;
     } 
     Turn=!Turn;
     checkIfWon(XorO[index]);
   }); 
}

void checkIfWon(String t){
  
  if(checkHorizontal() || checkVertical() || checkDiagnol())
  {
    showWinDialogue(t);
  }
  else if(filled == 9){
    showDrawDialogue();
  }
}
 
bool checkHorizontal(){
if((XorO[0]!='' && XorO[0]==XorO[1] && XorO[0]==XorO[2]) || 
   (XorO[3]!='' && XorO[3]==XorO[4] && XorO[3]==XorO[5]) ||
   (XorO[6]!='' && XorO[6]==XorO[7] && XorO[6]==XorO[8])
  )
  {
    return true;
  }
 else
 {
 return false;
 }
}

bool checkVertical(){
 if((XorO[0]!='' && XorO[0]==XorO[3] && XorO[0]==XorO[6]) ||
    (XorO[1]!='' && XorO[1]==XorO[4] && XorO[1]==XorO[7]) ||
    (XorO[2]!='' && XorO[2]==XorO[5] && XorO[2]==XorO[8])
   )
   {
    return true;
   } 
    else
    {
    return false;
    } 
}

bool checkDiagnol(){
 if((XorO[0]!='' && XorO[0]==XorO[4] && XorO[0]==XorO[8]) ||
    (XorO[2]!='' && XorO[2]==XorO[4] && XorO[6]==XorO[2])
   )
   {
     return true;
   } 
   else
   {
   return false;
   }
}

void showWinDialogue(String t){
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext){
      return AlertDialog(
       title: Text('Congratulations!! Player ' + t + ' won'), 
       actions: <Widget>[
         FlatButton(
           child: Text('Play Again!'),
          onPressed: (){
          clearBoard();
          Navigator.of(context).pop();
          },
         )
       ],  
      );
    });
    if(t=='O')
    {
      Oscore+=1;
    }
    else
    {
      Xscore+=1;
    }
}

void showDrawDialogue(){
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext){
      return AlertDialog(
       title: Text('DRAW!'), 
       actions: <Widget>[
         FlatButton(
           child: Text('Play Again!'),
          onPressed: (){
          clearBoard();
          Navigator.of(context).pop();
          },
         )
       ],  
      );
    });
}

void clearBoard()
{
  for(int i=0;i<9;i++)
  {
    setState(() {
    XorO[i]='';  
    });
  }
  filled=0;
}

}
