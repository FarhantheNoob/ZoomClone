import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';
import 'package:intl/intl.dart';

class MeetingsHistory extends StatelessWidget {
  const MeetingsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().meetingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                  'Room name: ${(snapshot.data! as dynamic).docs[index]['meetings']}'),
              subtitle: Text(
                'Joined at: ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['time'].toDate())}'
              ),
            ),
          );
        });
  }
}
