//
//  AnimationExploseContainer.m
//  UIViewAnimationExplose
//
//  Created by Tseho on 15/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import "AnimationExploseContainer.h"

@interface AnimationExploseContainer ()

@property (nonatomic) NSMutableArray* _views;
@property BOOL _isOpened;
@property UIView* _viewOpened;

@end

@implementation AnimationExploseContainer

////////////////////////////////////////////////////////
// Constructors
////////////////////////////////////////////////////////

- (id) init{
    self._isOpened = false;
    self._views = [[NSMutableArray alloc] init];
    return self;
}

- (id) initWithViews:(NSArray*) views{
    self._isOpened = false;
    self._views = [[NSMutableArray alloc] initWithArray:views];
    [self initViews];
    return self;
}

////////////////////////////////////////////////////////
// Views functions
////////////////////////////////////////////////////////

- (void) setViews:(NSArray*) views{
    self._views = [[NSMutableArray alloc] initWithArray:views];
    [self initViews];
}

- (NSArray*) getViews{
    return self._views;
}

- (void) addView:(UIView*) view{
    [self._views addObject:view];
    [self initListenerFor:view];
}

- (void) initViews{
    for (UIView* view in self._views) {
        [self initListenerFor:view];
    }
}

////////////////////////////////////////////////////////
// Events
////////////////////////////////////////////////////////


- (void) initListenerFor:(UIView*) view{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchElement:)];
    [view addGestureRecognizer:tap];
}

- (void)touchElement:(UITapGestureRecognizer*)gesture{
    if(self._isOpened){
        [self closeThisView:gesture.view];
    }else{
        [self openThisView:gesture.view];
    }
}

////////////////////////////////////////////////////////
// Animations
////////////////////////////////////////////////////////
    
- (void)openThisView:(UIView*) view{
    if(self._isOpened){
        [self closeThisView:self._viewOpened];
    }
    
    if([self._views containsObject:view]){
        for(id item in self._views){
            
            UIView *viewItem = item;
            if (viewItem != view) {
                
                // Add Animation to UIView
                [viewItem explositionWithOrigine:view.frame.origin WithDistance:1024.0f WithDuration:0.4f AndDelay:0.0f];
                
            }else{
                [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionAllowUserInteraction
                                 animations:^{viewItem.frame = CGRectMake(0,0,768, 1004);} completion:nil];
            }
        }
        self._isOpened = true;
        self._viewOpened = view;
    }
}

- (void)closeThisView:(UIView*) view{
    if(view == self._viewOpened){
        int numberColumn = 0,numberRaw=0;
        for(id item in self._views){
            UIView *viewItem = item;
            [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionAllowUserInteraction
                             animations:^{viewItem.frame = CGRectMake(10 + numberColumn * 252, 10 + numberRaw * 248, 242, 238);} completion:nil];
            numberColumn++;
            if (numberColumn > 2) {
                numberRaw++;
                numberColumn =0;
            }
        }
        self._isOpened = false;
    }
}

@end
