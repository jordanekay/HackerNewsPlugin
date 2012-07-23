//
//  QSInterfaceController+Async.m
//  Blekko
//
//  Created by Jordan Kay on 2/12/12.
//  Copyright (c) 2012 Laughing Sprout. All rights reserved.
//

#import "QSInterfaceController+Async.h"

@implementation QSInterfaceController (Async)

- (void)showArrayAsyncFromBlock:(QSInterfaceControllerAsyncBlock)arrayBlock
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSArray *array = arrayBlock();
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showArray:[NSMutableArray arrayWithArray:array]];
        });
    });
}

@end
