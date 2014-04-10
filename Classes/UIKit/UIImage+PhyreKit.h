//
//  UIImage+PhyreKit.h
//  Pods
//
//  Created by Matt Ricketson on 4/9/14.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (PhyreKit)

- (instancetype)phy_imageByCroppingToRect:(CGRect)rect;
- (instancetype)phy_imageByScalingToSize:(CGSize)size;

- (instancetype)phy_negativeImage;
- (instancetype)phy_imageWithWhiteBackground;
- (instancetype)phy_imageByMaskingWithColor:(UIColor *)color;

+ (instancetype)phy_imageWithColor:(UIColor *)color;

@end
