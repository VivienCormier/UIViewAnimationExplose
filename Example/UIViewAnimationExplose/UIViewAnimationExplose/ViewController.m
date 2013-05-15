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
        
        numberColumn++;
        if (numberColumn > 2) {
            numberRaw++;
            numberColumn =0;
        }
    }
    
    self.exploseContainer = [[AnimationExploseContainer alloc] initWithViews:self.allViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
