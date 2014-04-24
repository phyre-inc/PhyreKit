//
//  PHConstantsAndMacros.h
//  Stocks
//
//  Created by Matt Ricketson on 7/30/13.
//  Copyright (c) 2013 Phyre. All rights reserved.
//

#import "PHYConstantsAndMacros.h"

void phy_dispatch_sync_on_main_queue(void (^block)(void))
{
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}
