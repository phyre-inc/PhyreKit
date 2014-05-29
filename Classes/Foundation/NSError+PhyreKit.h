//
//  NSError+PhyreKit.h
//  Pods
//
//  Created by Matt Ricketson on 5/29/14.
//
//

#import <Foundation/Foundation.h>

void PHYGetTitleAndMessageFromError(NSError *error, NSString * __autoreleasing *title, NSString * __autoreleasing *message);

@interface NSError (PhyreKit)

@end
