//
//  ViewController.m
//  UIViewAnimationExplose
//
//  Created by dvd on 03/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import "ViewController.h"
#import "UIViewAnimationExplose.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.allViews = [[NSMutableArray alloc]init];
    
    int numberColumn = 0;
    int numberRaw = 0;
    
    for (int i = 0; i < 12; i++) {
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10 + numberColumn * 252, 10 + numberRaw * 248, 242, 238)];
        img.contentMode = UIViewContentModeScaleAspectFill;
        img.clipsToBounds = YES;
        img.userInteractionEnabled = YES;
        img.image = [UIImage imageNamed:@"becomeapanda_tumblr_com"];
        [self.view addSubview:img];
        
        [self.allViews addObject:img];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchElement:)];
        [img addGestureRecognizer:tap];
        
        numberColumn++;
        if (numberColumn > 2) {
            numberRaw++;
            numberColumn =0;
        }
    }
}

- (void)touchElement:(UITapGestureRecognizer*)gesture{
    
    UIView *viewtouch = gesture.view;
    
    // Reset position Image
    if (viewtouch.frame.size.height == 1004) {
        int numberColumn = 0,numberRaw=0;
        for(id item in _allViews){
            UIView *view = item;
            [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionAllowUserInteraction
                             animations:^{view.frame = CGRectMake(10 + numberColumn * 252, 10 + numberRaw * 248, 242, 238);} completion:nil];
            numberColumn++;
            if (numberColumn > 2) {
                numberRaw++;
                numberColumn =0;
            }
        }
    }else{
      
        //
        // Animation Explosition
        //
        
        // Init Animation
        UIViewAnimationExplose *animation = [[UIViewAnimationExplose alloc]init];
        
        for(id item in _allViews){
            
            UIView *view = item;
            if (view != viewtouch) {
                
                // Add Animation to UIView
                [animation explositionOf:view WithOrigine:viewtouch WithDistance:1024.0f WithDuration:0.4f AndDelay:0.0f];
                
            }else{
                [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionAllowUserInteraction
                                 animations:^{view.frame = CGRectMake(0,0,768, 1004);} completion:nil];
            }
        }
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
