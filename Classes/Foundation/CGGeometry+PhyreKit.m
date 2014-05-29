//
//  CGGeometry+PhyreKit.m
//  Pods
//
//  Created by Matt Ricketson on 5/29/14.
//
//

#import "CGGeometry+PhyreKit.h"

CGRect PHYBoundsMake(CGFloat width, CGFloat height)
{
    CGRect bounds;
    bounds.origin = CGPointZero;
    bounds.size = CGSizeMake(width, height);
    return bounds;
}

CGRect PHYRectGetBounds(CGRect rect)
{
    return PHYBoundsMake(CGRectGetWidth(rect), CGRectGetHeight(rect));
}
