import 'package:flutter/material.dart';
import 'package:videogame_info/api.dart';
import 'package:videogame_info/models/creatorInfo.dart';

class CreatorScreen extends StatefulWidget {
  const CreatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  _CreatorScreenState createState() => _CreatorScreenState();
}

class _CreatorScreenState extends State<CreatorScreen> {
  late Future<List<CreatorInfo>> creators;

  @override
  void initState() {
    super.initState();
    creators = apiLoadAllCreators();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Creators',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 41, 0, 82),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3C007A),
              Color.fromRGBO(60, 0, 122, 1.0),
              Color(0xFF681DB7),
            ],
            stops: [0.0, 0.35, 1.0],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20,
              width: screenSize.width,
            ),
            SizedBox(
              width: 400,
            ),
            Expanded(
              child: FutureBuilder<List<CreatorInfo>>(
                future: creators,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error loading creators'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No creators available'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final creator = snapshot.data![index];
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.transparent, 
                          child: ExpansionTile(
                            tilePadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent, 
                              backgroundImage: NetworkImage(creator.image),
                            ),
                            title: Text(
                              creator.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            children: [
                              ListTile(
                                title: Text(
                                  'Positions: ${creator.positions.join(", ")}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Games Count: ${creator.games.length}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Games:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: creator.games
                                          .map(
                                            (gameId) => FutureBuilder<String>(
                                              future: apiLoadGameName(gameId),
                                              builder: (context, gameSnapshot) {
                                                if (gameSnapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return CircularProgressIndicator();
                                                } else if (gameSnapshot.hasError) {
                                                  return Text('Error loading game name');
                                                } else {
                                                  return Text(
                                                    '- ${gameSnapshot.data}',
                                                    style: TextStyle(color: Colors.white),
                                                  );
                                                }
                                              },
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
