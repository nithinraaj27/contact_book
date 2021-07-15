import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<String> _searchable = [
    'NithinRaaj',
    'MadhuSri',
    'NithinRaaj',
    'MadhuSri',
    'Flutter',
    'Swift',
    'java',
    'python',
    'c',
    'c++',
    'c sharp'
  ];
  var items = <String>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.addAll(_searchable);
  }


  @override
  Widget build(BuildContext context) {

    final title = items.length.toString() + '  Contacts';
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.teal,
            title: Text(title,style: TextStyle(color: Colors.black,fontSize: 18,),),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Icon(Icons.group),
            backgroundColor: Colors.green.shade500,
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",
                  ),
                  onChanged: (value)
                  {
                    filterContact(value.toLowerCase());
                  },
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return Card(
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70,width: 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          margin: EdgeInsets.all(9.0),
                          padding: EdgeInsets.all(6.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                child: Text("${items[index][0]}"),
                                backgroundColor: Colors.green.shade200,
                                foregroundColor: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('${items[index]}',style: TextStyle(fontSize: 20.0),),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ));
  }

  void filterContact(String searchitem)
  {
    List<String> tmpSearchList = <String>[];

    tmpSearchList.addAll(_searchable);

    if(searchitem.isNotEmpty)
    {
      List<String> tmplist  = <String>[];
      tmpSearchList.forEach((element) {
        if(element.toLowerCase().contains(searchitem))
        {
          tmplist.add(element);
        }
      });

      setState(() {
        items.clear();
        items.addAll(tmplist);
      });

      return;
    }
    else
    {
      setState(() {
        items.clear();
        items.addAll(_searchable);
      });
    }

  }
}

