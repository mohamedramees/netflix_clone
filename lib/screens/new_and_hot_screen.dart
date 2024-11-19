import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/coming_soon_widgets(New&Hot).dart';

class NewAndHotScreen extends StatefulWidget {
  const NewAndHotScreen({super.key});

  @override
  State<NewAndHotScreen> createState() => _NewAndHotScreenState();
}

class _NewAndHotScreenState extends State<NewAndHotScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text(
            "New & Hot",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            const Icon(
              Icons.cast,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                'assets/avataaar.avif',
                height: 27,
                width: 27,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
          bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              labelColor: Colors.black,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: "  🍿 coming soon   ",
                ),
                Tab(
                  text: "🔥Everyone's watching",
                ),
              ]),
        ),
        body: const TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                 ComingSoonWidgets(
                  imageUrl: 'https://ntvb.tmsimg.com/assets/p27919791_b_h8_ab.jpg?w=960&h=540',
                  overview:
                      'Strange things are happening on the Chenoweths secluded Georgia farm. Their animals are spooked and restless, and their young son has wandered into the woods and come back confused and somehow changed. Stranger still, a mysterious man in a homemade gas mask has arrived and is spray-painting a blue line along the ground. All this leaves a disparate group of neighbors forced to band together in the face of an unknown and deadly threat. "Teacup" goes beyond chills and thrills and holds up a mirror to humanity, exploring darkness and genre-bending horror, mystery and drama.',
                  logoUrl: "https://i.ytimg.com/vi/RH_uLbRle_U/maxresdefault.jpg",
                  month: "Oct",
                  day: "10",
                ),
                SizedBox(
                  height: 30,
                ),
                ComingSoonWidgets(
                  imageUrl: 'https://wallpapers.com/images/hd/baahubali-prabhas-hd-battle-scene-hxopdqkgvq7chv4q.jpg',
                  overview:
                      'After learning that his father was brutally killed by Bhallaladeva, Mahendra Baahubali raises an army to defeat him and release his mother from the formers captivity.',
                  logoUrl:
                      "https://pics.filmaffinity.com/Baahubali_2_The_Conclusion-177423046-large.jpg",
                  month: "Apr",
                  day: "28",
                ),
                SizedBox(
                  height: 30,
                ),
                ComingSoonWidgets(
                  imageUrl: 'https://miro.medium.com/v2/resize:fit:1024/1*P_YU8dGinbCy6GHlgq5OQA.jpeg',
                  overview:
                      'When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.',
                  logoUrl:
                      "https://s3.amazonaws.com/www-inside-design/uploads/2017/10/strangerthings_feature-983x740.jpg",
                  month: "Jun",
                  day: "19",
                ),
                SizedBox(height: 30,),
                 ComingSoonWidgets(
                  imageUrl:  'https://www.pinkvilla.com/images/2022-09/rrr-review.jpg',
                  overview:
                       'A fearless revolutionary and an officer in the British force, who once shared a deep bond, decide to join forces and chart out an inspirational path of freedom against the despotic rulers.',
                  logoUrl:
                     "https://www.careerguide.com/career/wp-content/uploads/2023/10/RRR_full_form-1024x576.jpg",
                  month:  "Mar",
                  day: "07",
                ),
                SizedBox(
                  height: 30,
                ),

              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                ComingSoonWidgets(
                  imageUrl: 'https://images.ottplay.com/images/big/stree-2-new-poster-1721216275.jpeg',
                  overview:
                      'The town of Chanderi is being haunted again. This time, women are mysteriously abducted by a terrifying headless entity. Once again, it is up to Vicky and his friends to save their town and loved ones.',
                  logoUrl: "https://bigmovies.com.np/Modules/CineUploadFiles/Movie/HDImage/Stree-2-1_jpg_532545.png",
                  month: "Aug",
                  day: "15",
                ),
                SizedBox(
                  height: 30,
                ),
                ComingSoonWidgets(
                  imageUrl: 'https://c4.wallpaperflare.com/wallpaper/529/888/855/squid-game-tv-hd-wallpaper-preview.jpg',
                  overview:
                      'Hundreds of cash-strapped contestants accept an invitation to compete in childrens games for a tempting prize, but the stakes are deadly.',
                  logoUrl: "https://i.ytimg.com/vi/2sTbtCancxo/sddefault.jpg",
                  month: "Sep",
                  day: "17",
                ),
                  SizedBox(
                  height: 30,
                ),
                ComingSoonWidgets(
                  imageUrl:
                      'https://cdn.theplaylist.net/wp-content/uploads/2024/01/25085443/RDHS_2024_DigitalOneSheet_JakeChair_1944x2880_PRE_NoDimple_PV_FINAL_en-US_CPS.jpg',
                  overview:
                      'Ex-UFC fighter Dalton takes a job as a bouncer at a Florida Keys roadhouse, only to discover that this paradise is not all it seems.',
                  logoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKFFLGz6KiGBbAPFbJS10hYIh_5gLWA7C9aA&s",
                  month: "Mar",
                  day: "08",
                ),
              ],
            ),
          ),

        ]),
      ),
    );
  }
}
