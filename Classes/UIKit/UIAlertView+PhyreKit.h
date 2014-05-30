//
//  UIAlertView+PhyreKit.h
//  Pods
//
//  Created by Matt Ricketson on 5/29/14.
//
//

#import <UIKit/UIKit.h>
#import "NSError+PhyreKit.h"

@interface UIAlertView (PhyreKit)

+ (instancetype)phy_alertViewWithError:(NSError *)error;

@end
