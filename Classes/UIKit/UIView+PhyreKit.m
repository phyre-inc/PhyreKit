//
//  UIView+PhyreKit.m
//  Phyre
//
//  Created by Matt Ricketson on 2/27/14.
//  Copyright (c) 2014 Phyre Inc. All rights reserved.
//

#import "UIView+PhyreKit.h"

@implementation UIView (PHYAppearance)

- (void)phy_configureWithMaskedCornerRadius:(CGFloat)cornerRadius
                                borderColor:(UIColor *)borderColor
                                borderWidth:(CGFloat)borderWidth
{
	self.opaque = NO;
	
	self.layer.shouldRasterize = YES;
	self.layer.rasterizationScale = [UIScreen mainScreen].scale;
	self.layer.masksToBounds = YES;
	self.layer.cornerRadius = cornerRadius;
	self.layer.borderColor = [borderColor CGColor];
	self.layer.borderWidth = borderWidth;
}

- (void)phy_configureWithShadowColor:(UIColor *)shadowColor
                              radius:(CGFloat)shadowRadius
                             opacity:(CGFloat)shadowOpacity
{
	self.layer.masksToBounds = NO;
	self.layer.shadowColor = shadowColor.CGColor;
	self.layer.shadowRadius = shadowRadius;
	self.layer.shadowOpacity = shadowOpacity;
}

@end

@implementation UIView (PHYKeyboardAnimation)

+ (void)phy_animateWithKeyboardMetrics:(NSDictionary *)metrics block:(void (^)(NSDictionary *metrics))animationBlock
{
	NSParameterAssert(metrics);
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:[metrics[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
	[UIView setAnimationCurve:[metrics[UIKeyboardAnimationCurveUserInfoKey] integerValue]];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	if (animationBlock) {
		animationBlock(metrics);
	}
	
	[UIView commitAnimations];
}

@end
