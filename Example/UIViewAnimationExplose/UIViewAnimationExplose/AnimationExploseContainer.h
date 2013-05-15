//
//  AnimationExploseContainer.h
//  UIViewAnimationExplose
//
//  Created by Tseho on 15/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewAnimationExplose.h"

@interface AnimationExploseContainer : NSObject

- (id) init;

- (id) initWithViews:(NSArray*) views;

- (void) setViews:(NSArray*) views;

- (NSArray*) getViews;

- (void) addView:(UIView*) view;

- (void)openThisView:(UIView*) view;

- (void)closeThisView:(UIView*) view;

@end
