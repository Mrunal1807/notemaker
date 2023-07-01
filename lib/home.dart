import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesave/add_task_bar2.dart';
import 'package:notesave/detail.dart';


import 'detail.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 final Stream<QuerySnapshot>_stream=FirebaseFirestore.instance.collection("note").snapshots();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 0));

    setState(() {});


  }
  @override
  Widget build(BuildContext context) {
    //final dummyList=List.generate(50, (index) => CatalogModel.item[0]);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Colors.blueGrey.shade700,
        title: Text("Notes Maker",style: TextStyle(fontSize: 24),),
      ),
      body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child:CircularProgressIndicator());
            }
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemBuilder:(context, index) {
                    Map<String,dynamic> document=snapshot.data?.docs[index].data() as Map<String,dynamic>;
                    return Card(
                      elevation: 0.0,
                      child: ListTile(
                          tileColor: Colors.black12,
                          shape:  RoundedRectangleBorder(),
                          onTap: () async {

                          await Future.delayed(Duration(seconds: 0));
                            await Navigator.push(context,MaterialPageRoute(builder: (builder)=>details(
                              document: document,
                              id: snapshot.data!.docs[index].id,
                            )
                            )



                            );
                            setState(() {

                            });

                          },
                          leading: Image.asset('images/notes.png',scale: 10,),
                          title: Text(document["Title"]),
                          subtitle: Text(document["Date"]),


                      ),
                    );
                  },
                  itemCount:snapshot.data?.docs.length,
                )

            );
          }
      ),


      floatingActionButton:
      Container(
        height: 80,
        width: 80,

        child: FloatingActionButton(
          backgroundColor: Colors.blueGrey.shade700,
          onPressed: () async {
            await Future.delayed(Duration(seconds: 0));
            await Navigator.push(context,MaterialPageRoute(builder: (builder)=>AddTaskPage2()));
            setState(() {

            });
          },
          child:Icon(Icons.add,size: 35,),
        ),
      ),
    );

    //throw UnimplementedError();

  }


}
