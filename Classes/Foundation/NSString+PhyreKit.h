//
//  NSString+PhyreKit.h
//  
//
//  Created by Matt Ricketson on 4/3/14.
//
//

#import <Foundation/Foundation.h>

BOOL PHYStringIsEmpty(NSString *str);
BOOL PHYEqualStrings(NSString *str1, NSString *str2);

/**
 Creates a string representation of a BOOL value.
 
 @discussion
 This is a convenience function mostly for debugging purposes, when it is helpful to print the contents of a BOOL variable.
 
 This function does not return a localized string.
 
 @return A string representing the BOOL value.
 */
NSString * PHYStringFromBOOL(BOOL aBool);


#pragma mark -

@interface NSString (PhyreKit)

@end
