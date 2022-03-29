import 'package:fidigames/screens/screen3.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new),
                  Text("Add a Game"),
                ],
              ),
            ),
            TextContainer(
              text1: "Name of the Game",
              text2: "Among us",
            ),
            TextContainer(
              text1: "Description",
              text2: "Join your crewmates in a multiplayer game of teamwork.",
              maxlines: 3,
            ),
            TextContainer(
              text1: "Game URL",
              text2: "www.amongus.com",
            ),
            ColumnWithRow(
              text: "Players Count",
            ),
            TextContainer(
              text1: "Category",
              text2: "Choose the category of game",
              isSuffixIcon: true,
            ),
            TextContainer(
              text1: "",
              text2: "Upload an image",
              isPrefixIcon: true,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThirdScreen()));
              },
              child: const Text(
                "Submit",
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                primary: Colors.amber,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget TextContainer({
    required String text1,
    required String text2,
    int? maxlines,
    bool isPrefixIcon = false,
    bool isSuffixIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isPrefixIcon
                    ? Container(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.drive_folder_upload,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      )
                    : const SizedBox(),
                Expanded(
                  child: Text(
                    text2,
                    maxLines: maxlines,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                isSuffixIcon
                    ? const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ColumnWithRow({required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            RowText(text3: "Minimum Count"),
            const SizedBox(
              width: 8,
            ),
            ContainerNum(textNum: 2),
            const SizedBox(width: 75),
            RowText(text3: "Maximum Count"),
            ContainerNum(textNum: 8),
          ],
        ),
      ],
    );
  }

  Widget RowText({required String text3}) {
    return Text(
      text3,
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }

  Widget ContainerNum({required int textNum}) {
    return Container(
      width: 25,
      height: 25,
      child: Center(child: Text(textNum.toString())),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
