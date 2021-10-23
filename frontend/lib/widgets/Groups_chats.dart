import 'package:chat_app_project/models/Groups.dart';
import 'package:chat_app_project/models/message_model.dart';
import 'package:chat_app_project/pages/Groups_Page.dart';
import 'package:chat_app_project/pages/chat_window.dart';
import 'package:chat_app_project/pages/group_channels.dart';
import 'package:flutter/material.dart';

class Groups_chats extends StatelessWidget {
  @override

  void _showDialog_for_confirm_delete_account(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Alert!"),
          content: new Text("Are you sure you want to delete this group?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("CANCEL"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
                onPressed: () {Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Group_Page()));},
                 child: new Text("YES"))
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 278.0, //just used to test
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.0),
            topRight: Radius.circular(28.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.0),
            topRight: Radius.circular(28.0),
          ),
          child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (BuildContext context, int k) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => group_channels(channels: groups[k].group_channels,group: groups[k],))),
                child: Container(
                  margin: EdgeInsets.only(
                    top: 5.0,
                    bottom: 5.0,
                    right: 20.0,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 7.5, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: chats[k].unread ? Color(0xFFFFEFEE) : Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35.0,
                            backgroundImage:
                                AssetImage(chats[k].sender.imageUrl),
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.50,
                                child: Text(
                                  groups[k].Group_name,
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.0),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          PopupMenuButton(itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: 'edit',
                                child: Text('Edit',style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text('Delete', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ];
                          },
                            onSelected: (String value){
                            if(value=='edit'){
                              print("edit value pressed");
                            }
                            else if(value=='delete')
                              {
                                _showDialog_for_confirm_delete_account(context);
                              }
                            },
                          ),

                          Text(
                            chats[k].time,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2.5),
                          chats[k].unread
                              ? Container(
                                  width: 40.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'NEW',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Text(''),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
