import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/src/data_models/user_db.dart';

class ChangeAvatar extends StatelessWidget {
  const ChangeAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text("PocketDad"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                "Change my appearance!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile("assets/images/dad1.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad2.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad3.JPG"),
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile("assets/images/dad4.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad5.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad6.JPG"),
                  ]
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Profile("assets/images/dad7.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad8.JPG"),
                    SizedBox(width: 10,),
                    Profile("assets/images/dad9.JPG"),
                  ]
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Random!",
                  textAlign: TextAlign.right,
                )
            ),
            Image.asset(userDB.getUser(currentUserID).dadPic)
          ],
        ),
      ),
    );
  }
}

class Profile extends ConsumerWidget{

  final avatarStateProvider = StateProvider<String>((ref) {
    String avatarString = "assets/images/dad1.JPG";
    return avatarString;
  });

  final String avatarImage;
  Profile(this.avatarImage, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatar = ref.watch(avatarStateProvider);
    userDB.getUser(currentUserID).dadPic = avatar;
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepOrange, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => {
          ref.read(avatarStateProvider.notifier).state = avatarImage
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(avatarImage),
        ),
      ),
    );
  }
}
