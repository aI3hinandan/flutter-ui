import 'package:flutter/material.dart';


class EETransition extends StatefulWidget {
  final Widget child;
  final bool fromTop;
  const EETransition({Key key, this.child, this.fromTop}) : super(key: key);
  @override
  EETransitionState createState() => EETransitionState();
}

class EETransitionState extends State<EETransition> with SingleTickerProviderStateMixin {
  AnimationController _ac;
  Animation _animation;

  @override
  void dispose() {
    super.dispose();
    _ac.dispose();
  }
  @override
  void initState() {
    super.initState();
    _ac = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    _animation = CurvedAnimation(
      parent: _ac,
      curve: Curves.easeOutBack
    );
    start();
  }

  void start(){
    _ac.forward();
  }

  void close(){
    _ac.reverse();
  }
  @override
  Widget build(BuildContext context) {
    if(widget.fromTop){
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context,child){
        return Transform.translate(
          offset: Offset(0,-MediaQuery.of(context).size.height*(10/20)*(1 - _animation.value)),
          child: child,
        );
      },

    );}else{
      return AnimatedBuilder(
        animation: _animation,
        child: widget.child,
        builder: (context,child){
          return Transform.translate(
            offset: Offset(0,MediaQuery.of(context).size.height*(10/20)*(1 - _animation.value)),
            child: child,
          );
        },

      );
  }
}



}