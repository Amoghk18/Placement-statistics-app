import 'package:flutter/material.dart';
import 'package:placement_stats/Screens/DetailScreens/student/experience_detail.dart';
import 'package:provider/provider.dart';
import '../../Providers/Experience.dart';

class ExperiencesList extends StatefulWidget {
  @override
  _ExperiencesListState createState() => _ExperiencesListState();
}

class _ExperiencesListState extends State<ExperiencesList>
    with SingleTickerProviderStateMixin {
      
  AnimationController _animationController;
  Animation _animation;
  bool _isLoading = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    Provider.of<Experience>(context, listen: false).getAndSetExps().then((_) {
      setState(() {
        _isLoading = false;
      });
      _animationController.forward();
    });
    super.initState();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  void _pushToDetailScreen(int i, ExperienceModel exp) {
    Navigator.of(context).pushNamed(
      ExperienceDetailScreen.routeName,
      arguments: {"data": exp},
    );
  }

  @override
  Widget build(BuildContext context) {
    final _exp = Provider.of<Experience>(context).experiences;
    return _isLoading
        ? Container(
            height: MediaQuery.of(context).size.height * 0.38,
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ),
            ),
          )
        : FadeTransition(
            opacity: _animation,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.37,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _exp.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Hero(
                    tag: _exp[i].companyName,
                    child: Card(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        splashColor: Colors.orange,
                        onTap: () => _pushToDetailScreen(i, _exp[i]),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.red, blurRadius: 40),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _exp[i].name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                _exp[i].companyName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                _exp[i].college,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 2,
                                endIndent: 15,
                                height: 30,
                              ),
                              Text(
                                "Let's see what they have to say...",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '"${_exp[i].exp}"',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black87,
                                ),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Click to see more!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
