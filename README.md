UIViewAnimationExplose
======================
<p> V 1.1 - 05-10-2013</p>

<p>For UIView separation with animation</p>
<a href="http://www.viviencormier.fr/" target="_blank">My WebSite</a> - <a href="https://twitter.com/VivienCormier" target="_blank">My Twitter</a>

Screenshot & Demo Video
-----------------------

<p>To see a demo video, click <a href="http://www.youtube.com/watch?v=7aTUIjEhG1I" target="_blank">here</a></p>
<a href="http://www.youtube.com/watch?v=7aTUIjEhG1I" target="_blank">
  <img alt="ScreenShot Demo Video" src="https://github.com/VivienCormier/UIViewAnimationExplose/blob/master/Example/UIViewAnimationExplose/UIViewAnimationExplose/example.png?raw=true" width="600" height="281" />
</a>

How To Get Started
------------------

<p>Add "UIViewAnimationExplose.h" and "UIViewAnimationExplose.m" in your xcodeprojet. Import the .h file :</p>
``` objective-c
#import "UIViewAnimationExplose.h"
```

<p>And add the animation</p>
``` objective-c

// Center of explosion
CGPoint center = CGPointMake(20,300);

// view is the object I want it move
[view explositionWithOrigine:center WithDistance:1024.0f WithDuration:0.4f AndDelay:0.0f];
```
