//
//  NSDate+PhyreKit.h
//  Pods
//
//  Created by Matt Ricketson on 6/9/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (PhyreKit)

+ (NSString *)phy_localizedStringForDaySinceNowFromTimestamp:(NSDate *)timestamp;

+ (NSString *)phy_localizedStringForDaySinceNowFromTimestamp:(NSDate *)timestamp
                                      showsTimeOfDayForToday:(BOOL)showsTimeOfDayForToday;

@end
