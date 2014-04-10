//
//  UIFont+PhyreAdditions.m
//  Rally
//
//  Created by Matt Ricketson on 2/2/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import "UIFont+PhyreKit.h"

@implementation UIFont (PhyreKit)

+ (UIFont *)phy_preferredFontForTextStyle:(NSString *)style withSymbolicTraits:(UIFontDescriptorSymbolicTraits)symbolicTraits
{
	UIFont *font = [UIFont preferredFontForTextStyle:style];
	UIFontDescriptor *fontDesciptor = [[font fontDescriptor] fontDescriptorWithSymbolicTraits:symbolicTraits];
	return [UIFont fontWithDescriptor:fontDesciptor size:0];
}

@end
