//
//  UIViewAnimationExplose.h
//  V 1.1
//  05-10-2013
//
//  Created by dvd on 03/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (UIViewAnimationExplose)

- (void)explositionWithOrigine:(CGPoint)origine WithDistance:(float)distance WithDuration:(float)duration AndDelay:(float)delay;

- (CGPoint)finalPositionFor:(CGPoint)viewStart WithOrigine:(CGPoint)viewOrigine AndDistance:(float)distance;

@end
