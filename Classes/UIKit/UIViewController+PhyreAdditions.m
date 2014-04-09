//
//  UIViewController+PhyreAdditions.m
//  Rally
//
//  Created by Matt Ricketson on 1/5/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import "UIViewController+PhyreAdditions.h"

@implementation UIViewController (PhyreAdditions)

- (BOOL)phy_isViewVisible
{
	return (self.isViewLoaded && self.view.window);
}

@end
