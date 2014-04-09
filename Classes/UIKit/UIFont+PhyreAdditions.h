//
//  UIFont+PhyreAdditions.h
//  Rally
//
//  Created by Matt Ricketson on 2/2/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (PhyreAdditions)

+ (UIFont *)phy_preferredFontForTextStyle:(NSString *)style withSymbolicTraits:(UIFontDescriptorSymbolicTraits)symbolicTraits;

@end
