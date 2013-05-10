//
//  UIViewAnimationExplose.m
//  V 1.1
//  05-10-2013
//
//  Created by dvd on 03/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import "UIViewAnimationExplose.h"

@implementation UIView (UIViewAnimationExplose)

- (void)explositionWithOrigine:(CGPoint)origine WithDistance:(float)distance WithDuration:(float)duration AndDelay:(float)delay{
    
    CGPoint final   = [self finalPositionFor:self.frame.origin WithOrigine:origine AndDistance:distance];
    
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         self.frame = CGRectMake(final.x, final.y, self.frame.size.width, self.frame.size.height);
                     } completion:nil];
    
}

- (CGPoint)finalPositionFor:(CGPoint)pointStart WithOrigine:(CGPoint)pointOrigine AndDistance:(float)distance{
    
    CGPoint origin  = CGPointMake(pointOrigine.x, pointOrigine.y);
    CGPoint start   = CGPointMake(pointStart.x, pointStart.y);
    
    float startDistance = sqrtf((start.x - origin.x)*(start.x - origin.x) + (start.y - origin.y)*(start.y - origin.y));
    float distanceX = (start.x - origin.x) * ( startDistance + distance ) / startDistance;
    float distanceY = (start.y - origin.y) * ( startDistance + distance ) / startDistance;
    
    float finalX;
    float finalY;
    
    if (origin.x == start.x && origin.y == start.y) {
        finalX = origin.x;
        finalY = origin.y;
    }else if(origin.x == start.x) {
        finalX = origin.x;
        finalY = origin.y + distanceY;
    }else if(origin.y == start.y){
        finalX = origin.x + distanceX;
        finalY = origin.y;
    }else{
        finalX = origin.x + distanceX;
        finalY = origin.y + distanceY;
    }
    
    CGPoint final   = CGPointMake(finalX, finalY);
    
    return final;
}

@end
