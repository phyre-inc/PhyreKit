// UIView+PhyreKit.m
//
// Copyright (c) 2014 Phyre Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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
