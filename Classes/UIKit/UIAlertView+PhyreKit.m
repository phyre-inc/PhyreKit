//
//  UIAlertView+PhyreKit.m
//  Pods
//
//  Created by Matt Ricketson on 5/29/14.
//
//

#import "UIAlertView+PhyreKit.h"

@implementation UIAlertView (PhyreKit)

- (instancetype)phy_alertViewWithError:(NSError *)error
{
    NSString *title = nil;
	NSString *message = nil;
	
	PHYGetTitleAndMessageFromError(error, &title, &message);
	
	UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = title;
    alertView.message = message;
	return alertView;
}

@end
