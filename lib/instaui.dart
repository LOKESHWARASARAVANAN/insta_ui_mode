import 'package:flutter/material.dart';

class Instauimodel extends StatelessWidget {
  const Instauimodel({super.key});

  @override
  Widget build(BuildContext context) {
    // List of unique image URLs for the avatar
    List<String> avatarImageUrls = [
      'https://cdn.pixabay.com/photo/2016/11/29/20/22/girl-1871104_640.jpg',
    ];

    // List of unique image URLs for the grid
    List<String> gridImageUrls = [
      'https://cdn.pixabay.com/photo/2016/11/23/17/25/woman-1853939_640.jpg',
      'https://cdn.pixabay.com/photo/2015/12/25/15/53/girl-1107788_640.jpg',
      'https://cdn.pixabay.com/photo/2016/11/18/19/07/happy-1836445_640.jpg',
      'https://cdn.pixabay.com/photo/2017/04/01/21/06/portrait-2194457_640.jpg',
      'https://cdn.pixabay.com/photo/2019/11/26/17/48/girl-4655079_640.jpg',
      // Add more URLs as needed
    ];

    List<String> circleAvatarUrls = [
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/instagram-3814051_640.png',
      'https://cdn.pixabay.com/photo/2023/02/01/10/37/sunset-7760143_640.jpg',
      'https://cdn.pixabay.com/photo/2017/03/27/13/52/person-2178868_640.jpg',
      'https://cdn.pixabay.com/photo/2016/03/28/09/36/music-1285165_640.jpg',
      'https://cdn.pixabay.com/photo/2024/06/13/15/51/ai-generated-8827898_640.jpg',
      // Add more URLs as needed
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: false,
        title: const Text(
          'Lokesh.P',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          // Avatar and Profile Information
          Container(
            height: 200,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(avatarImageUrls[0]),
                        radius: 50,
                      ),
                      const SizedBox(height: 5),
                      const Flexible(
                        child: Text(
                          'Lokesh',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Flexible(
                        child: Text(
                          'photographer',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profileDetails('60', 'posts'),
                          profileDetails('1.2k', 'followers'),
                          profileDetails('150', 'following'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                                ),
                                onPressed: () {},
                                child: const Text('follow'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 2),
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_downward,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Horizontal list of different images
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: circleAvatarUrls.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(circleAvatarUrls[index]),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Text('Title'),
                  ],
                );
              },
            ),
          ),

          // Row for Icons (Images, Reels, Tags)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              show('Images', const Icon(Icons.grid_4x4)),
              show('Reels', const Icon(Icons.video_call_outlined)),
              show('Tags', const Icon(Icons.tag_faces_outlined)),
            ],
          ),

          // Grid of different images
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: gridImageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      gridImageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget profileDetails(String text1, String text2) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          text2,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  Widget show(String text1, Icon icon) {
    return Column(
      children: [
        Text(
          text1,
          style: const TextStyle(fontSize: 24),
        ),
        icon, // Use the Icon widget directly without casting
      ],
    );
  }
}
