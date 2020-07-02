## CustomTransition

##### Make Custom Transition in flutter

## Show Case :

|                           gif file                           |
| :----------------------------------------------------------: |
| ![show case](https://github.com/mahmoud-eslami/Custom_transaction/blob/master/Files/Screencast-2020-07-02-123506.gif) |

using :

```dart
PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return StaggeredPageAnimation(transactionAnimation: animation);
      },
      transitionDuration: Duration(milliseconds: 1500)),
);
```

for navigation and use :

```dart
AnimatedBuilder(
  animation: transactionAnimation,
  builder: (context, child) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: Offset(beginDx, beginDy), end: Offset(endDx, endDy))
          .animate(
        CurvedAnimation(
            curve: Interval(startInterval, endInterval,
                curve: curvesAnimation),
            parent: transactionAnimation),
      ),
      child: child,
    );
  },
  child: mainChild,
);
```

for handle animation .


