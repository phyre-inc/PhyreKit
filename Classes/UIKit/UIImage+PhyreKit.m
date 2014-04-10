//
//  UIImage+PhyreKit.m
//  Pods
//
//  Created by Matt Ricketson on 4/9/14.
//
//

#import "UIImage+PhyreKit.h"

@implementation UIImage (PhyreKit)

- (instancetype)phy_imageByCroppingToRect:(CGRect)rect
{
    if (self.scale > 1.0f) {
        rect = CGRectMake(rect.origin.x * self.scale,
                          rect.origin.y * self.scale,
                          rect.size.width * self.scale,
                          rect.size.height * self.scale);
    }
	
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return image;
}

- (instancetype)phy_imageByScalingToSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (instancetype)phy_negativeImage
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeCopy);
    [self drawInRect:CGRectMake(0.5, 0.5, self.size.width-1.0, self.size.height-1.0)];
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeDifference);
    CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(),[UIColor whiteColor].CGColor);
    CGContextFillRect(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, self.size.width, self.size.height));
    UIImage *negativeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return negativeImage;
}

- (instancetype)phy_imageWithWhiteBackground
{
    UIImage *negative = [self phy_negativeImage];
	
	UIGraphicsBeginImageContextWithOptions(negative.size, NO, 0);
    CGContextSetRGBFillColor (UIGraphicsGetCurrentContext(), 1, 1, 1, 1);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = CGPointZero;
    thumbnailRect.size.width = negative.size.width;
    thumbnailRect.size.height = negative.size.height;
	
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0, negative.size.height);
    CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1.0, -1.0);
    CGContextFillRect(UIGraphicsGetCurrentContext(), thumbnailRect);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), thumbnailRect, negative.CGImage);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    return image;
}

- (instancetype)phy_imageByMaskingWithColor:(UIColor *)color
{
    UIImage *formattedImage = [self phy_imageWithWhiteBackground];
	
    CGRect rect = {0, 0, formattedImage.size.width, formattedImage.size.height};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *tempColor = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    CGImageRef maskRef = [formattedImage CGImage];
    CGImageRef maskcg = CGImageMaskCreate(CGImageGetWidth(maskRef),
										  CGImageGetHeight(maskRef),
										  CGImageGetBitsPerComponent(maskRef),
										  CGImageGetBitsPerPixel(maskRef),
										  CGImageGetBytesPerRow(maskRef),
										  CGImageGetDataProvider(maskRef), NULL, false);
	
    CGImageRef maskedcg = CGImageCreateWithMask([tempColor CGImage], maskcg);
    CGImageRelease(maskcg);
    UIImage *image = [UIImage imageWithCGImage:maskedcg scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    CGImageRelease(maskedcg);
	
    return image;
}

+ (instancetype)phy_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0); // Create a 1 by 1 pixel context
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsZero];
}

@end
