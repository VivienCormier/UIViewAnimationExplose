//
//  UIViewAnimationExplose.h
//  ipadetapes
//
//  Created by dvd on 03/05/13.
//  Copyright (c) 2013 Pyramyd NTCV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewAnimationExplose : NSObject

- (void)explositionOf:(UIView *)viewStart WithOrigine:(UIView *)viewOrigine WithDistance:(float)distance WithDuration:(float)duration AndDelay:(float)delay;

- (CGPoint)finalPositionFor:(UIView *)viewStart WithOrigine:(UIView *)viewOrigine AndDistance:(float)distance;

@end
