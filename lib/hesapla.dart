import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o/main.dart';
//import ‘package:flutter/services.dart’;
class su extends StatefulWidget {
  @override
  _suState createState() => _suState();
}
 
class _suState extends State<su> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor:Colors.red[100] ,
      appBar:AppBar(
        title: Text('SU İHTİYACI'),
        backgroundColor: Colors.blue[400],
      ),
      body:suHesapla(),                             
    ),
   );       
  }
}

class suHesapla extends StatefulWidget {
  @override
  _suHesaplaState createState() => _suHesaplaState();
}

class _suHesaplaState extends State<suHesapla> {
   final TextEditingController t1 = TextEditingController(text: "");
   final TextEditingController t2 = TextEditingController(text: "");
  double erkek=0, kadin=0, oran=0.0, k=0, k1=0, o=0;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
                      child: Row(
                         children: [
                                           
                     Container(
                       margin: EdgeInsets.only(left: 20, top: 20),
                     padding: EdgeInsets.all(20),
                        height: 80,
                        width: 100,
                        color: Colors.blueAccent,

                        child: Text('Kilonuzu Girin',
                        softWrap: true,
                        overflow:TextOverflow.clip ,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 14)
                        ), 
                        ),
                       SizedBox(width: 10,height: 10,),

                      Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        padding: EdgeInsets.all(20),
                        height: 80,
                        width: 100,
                        color: Colors.blueAccent,
                        child:TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.red,
                          maxLength: 4,
                           // obscureText: true ,//rakamı gizler
                          decoration: InputDecoration(
                          hintText: t1.text,hintStyle:                         
                          TextStyle(                          
                            color:Colors.blueAccent, fontSize: 14),
                            ),
                        controller: t1,
                        ),    
                      ),
                      
                   ]
            ),
          ),
                    SizedBox(width: 10,height: 2,),    
              Expanded(
                              child: Row(
                  children: [
                   
                   
                    Title(color:Colors.blueAccent, 
                    child: Expanded(
                    child: Text(' Günlük Spor Yapma Yoğunluğunuz:',
                      
                      ),
                    ),
                    ),
                   Slider(
                     min:0.0,
                     max:5.0,
                     value: oran,
                      onChanged: (double newValue){
                        setState((){
                           oran=newValue;
                        }
                       
                        );
                      }
                      ),
                      Text('${oran.round()}'),
                  ],
                ),
              ),
               SizedBox(height: 10,),
              Expanded(
                              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  
                  children:[
                    ElevatedButton(
                      
                      child:Text('Hesapla Erkek'),
                      onPressed: (){
                      setState((){
                       if(double.parse(t1.text)==0){
                         k=0;
                       } else{
                       o = oran * 0.250;
                       erkek=0.250;
                       k = (0.03 * double.parse(t1.text)) + o + erkek;} 
                    //////////////////
                      }
                      );
                    },
                     ),
                     Text('${k.toStringAsFixed(2)} Lt'),
                   
                  ]
                ),
              ),
              
           Expanded(
                        child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:[
                    ElevatedButton(
                      child:Text('Hesapla Kadın'),                    
                      onPressed: (){
                      setState((){
                        if(double.parse(t1.text)==0){
                         k1=0;
                       } else{
                       o = oran * 0.250;
                       k1 = (0.03 * double.parse(t1.text)) + o;
                       }
                     },
                   );
                  },
                     ),
                     Text('${k1.toStringAsFixed(2)} Lt'),
               ]
             ),
           ),
              
     Expanded(
            child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children:[
                    ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                     MaterialStateProperty.all<Color>(Colors.red) ),
                      child:Text('Temizle'),
                      onPressed: (){
                      setState((){
                       k=0;
                       k1=0;
                       t1.text=" ";
                      oran=0;
                         }
                       );
                     },
                   ),
                     SizedBox(height: 0, width: 80,),
                   ElevatedButton(
                     style: ButtonStyle(backgroundColor:
                     MaterialStateProperty.all<Color>(Colors.green) ),
                     child:Text('Ana Menü'),
                   onPressed: ()
                   =>Navigator.push(context,MaterialPageRoute(
                     builder: (context)=>MyApp()),
             ),
            )  
          ]
        ),
      ),
    ],         
   ), 
  ); 

 }
}     
     class Hesap {
       double k,k1;
       Hesap(double k, double k1){
         this.k=k;
         this.k1=k1;
 }
}
    
