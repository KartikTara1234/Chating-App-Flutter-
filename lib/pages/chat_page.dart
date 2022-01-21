import 'package:chatz/core/consts.dart';
import 'package:chatz/core/flutter_icons.dart';
import 'package:chatz/models/chat_model.dart';
import 'package:chatz/pages/chat_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> list = ChatModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: Text(
          "Chatz",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FlutterIcons.filter,
              color: AppColors.blueColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.darkColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FlutterIcons.search,
                  color: Colors.white54,
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: Colors.white54,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ChatItemPage(),
                      ),
                    );
                  },
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                      image: DecorationImage(
                        image: ExactAssetImage("assets/default.jpg"),
                      ),
                    ),
                  ),
                  title: Text(
                    list[index].contact.name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: list[index].isTyping
                      ? Row(children: <Widget>[
                          SpinKitThreeBounce(
                            color: AppColors.blueColor,
                            size: 20.0,
                          ),
                        ])
                      : Row(
                          children: <Widget>[
                            Text(
                              list[index].lastMessage,
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              list[index].lastMessageTime + "days ago",
                              style: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
        backgroundColor: AppColors.blueColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.darkColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.home),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.calendar),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.chat),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FlutterIcons.menu),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
