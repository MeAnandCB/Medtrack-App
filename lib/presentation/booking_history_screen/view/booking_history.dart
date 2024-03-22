import 'package:college/box/box.dart';
import 'package:college/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    historyBox.clear();
                    setState(() {});
                  });
                },
                icon: Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          ListView.separated(
              reverse: true,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: historyBox.length,
              itemBuilder: (context, index) {
                HistoryModel history = historyBox.getAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(history.image),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  history.name,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  history.department,
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      _formatDate(history.date.toString()),
                                      style: TextStyle(
                                        fontSize: 11,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Text(
                                      "${history.time}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              history.fee,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  )),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString); // Parse the date string
    String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    // Dateformat('dd-MM-yyyy').format(dateTime); // Format the date
    return formattedDate;
  }
}
