//
//  NSAttributedString+PhyreAdditions.m
//  Rally
//
//  Created by Matt Ricketson on 1/4/14.
//  Copyright (c) 2014 Phyre. All rights reserved.
//

#import "NSAttributedString+PhyreAdditions.h"

@implementation NSAttributedString (PhyreAdditions)

+ (instancetype)phy_stringWithString:(NSString *)str
{
	return [[self alloc] initWithString:(str ?: @"")];
}

+ (instancetype)phy_stringWithString:(NSString *)str attributes:(NSDictionary *)attrs
{
	return [[self alloc] initWithString:(str ?: @"") attributes:attrs];
}

+ (instancetype)phy_stringWithAttributedString:(NSAttributedString *)attrStr
{
	return [[self alloc] initWithAttributedString:attrStr];
}

@end


@implementation NSMutableAttributedString (PhyreAdditions)

- (void)phy_setAllAttributes:(NSDictionary *)attrs
{
	[self setAttributes:attrs range:NSMakeRange(0, self.length)];
}

- (void)phy_replaceOccurrencesOfString:(NSString *)str withAttributedString:(NSAttributedString *)attrString
{
	NSRange fullRange = NSMakeRange(0, self.length);
	NSRange range = fullRange;
	
	while ((range = [self.string rangeOfString:str options:NSCaseInsensitiveSearch range:range]).location != NSNotFound) {
		[self replaceCharactersInRange:range withAttributedString:attrString];
		
		NSUInteger location = range.location + range.length;
		range = NSMakeRange(location, fullRange.length - location);
	}
}

@end
