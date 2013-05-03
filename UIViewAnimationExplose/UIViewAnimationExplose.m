//
//  UIViewAnimationExplose.m
//  ipadetapes
//
//  Created by dvd on 03/05/13.
//  Copyright (c) 2013 Pyramyd NTCV. All rights reserved.
//

#import "UIViewAnimationExplose.h"

@implementation UIViewAnimationExplose

- (id)init{
    return self;
}

- (void)explositionOf:(UIView *)start WithOrigine:(UIView *)origine WithDistance:(float)distance WithDuration:(float)duration AndDelay:(float)delay{
    
    CGPoint final   = [self finalPositionFor:start WithOrigine:origine AndDistance:distance];
    
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         start.frame = CGRectMake(final.x, final.y, start.frame.size.width, start.frame.size.height);
                     } completion:nil];
    
}

- (CGPoint)finalPositionFor:(UIView *)viewStart WithOrigine:(UIView *)viewOrigine AndDistance:(float)distance{
    
    CGPoint origin  = CGPointMake(viewOrigine.frame.origin.x, viewOrigine.frame.origin.y);
    CGPoint start   = CGPointMake(viewStart.frame.origin.x, viewStart.frame.origin.y);
    
    float startDistance = sqrtf((start.x - origin.x)*(start.x - origin.x) + (start.y - origin.y)*(start.y - origin.y));
    float distanceX = (start.x - origin.x) * ( startDistance + distance ) / startDistance;
    float distanceY = (start.y - origin.y) * ( startDistance + distance ) / startDistance;
    
    float finalX;
    float finalY;
    
    if (origin.x == start.x) {
        finalX = origin.x;
        finalY = origin.y + distanceY;
    }else{
        finalX = origin.x + distanceX;
        finalY = origin.y + distanceY;
    }
    
    CGPoint final   = CGPointMake(finalX, finalY);
    
    return final;
}

@end
