// UIView+PhyreKit.h
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

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (PHYAppearance)

/**
 Convenience method for configuring a view with a specified border and masked to a corner radius with a transparent background.
 
 @param cornerRadius The corner radius to mask the view bounds to.
 @param borderColor The color of the view's border.
 @param borderWidth The width of the view's border.
 */
- (void)phy_configureWithMaskedCornerRadius:(CGFloat)cornerRadius
                                borderColor:(UIColor *)borderColor
                                borderWidth:(CGFloat)borderWidth;

/**
 Convenience method for configuring a view with a drop shadow.
 
 @param shadowColor The color of the drop shadow.
 @param shadowRadius The radius of the drop shadow.
 @param shadowOpacity The opacity of the drop shadow.
 */
- (void)phy_configureWithShadowColor:(UIColor *)shadowColor
                              radius:(CGFloat)shadowRadius
                             opacity:(CGFloat)shadowOpacity;

@end

@interface UIView (PHYKeyboardAnimation)

/**
 Convenience class method for timing animations in conjunction with a showing/hiding keyboard.
 
 @discussion
 The `userInfo` property of a `UIKeyboard...` notification contains metrics about the animation used to
 show/hide the keyboard. In iOS 7, keyboards use special, non-standard animation curves, so interfaces must
 use the provided metrics to create synced animations.
 
 @param metrics Dictionary of animation metrics. Usually the `userInfo` provided by a keyboard notification.
 @param animationBlock Block to be executed within the animation block. All synced animations should be passed in here.
 */
+ (void)phy_animateWithKeyboardMetrics:(NSDictionary *)metrics block:(void (^)(NSDictionary *metrics))animationBlock;

@end
