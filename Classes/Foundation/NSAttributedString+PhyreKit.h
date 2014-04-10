//
//  NSAttributedString+PhyreAdditions.h
//  Rally
//
//  Created by Matt Ricketson on 1/4/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (PhyreKit)

+ (instancetype)phy_stringWithString:(NSString *)str;
+ (instancetype)phy_stringWithString:(NSString *)str attributes:(NSDictionary *)attrs;
+ (instancetype)phy_stringWithAttributedString:(NSAttributedString *)attrStr;

@end


@interface NSMutableAttributedString (PhyreKit)

- (void)phy_setAllAttributes:(NSDictionary *)attrs;
- (void)phy_replaceOccurrencesOfString:(NSString *)str withAttributedString:(NSAttributedString *)attrString;

@end
