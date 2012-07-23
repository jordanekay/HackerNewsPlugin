//
//  QSInterfaceController+Async.h
//  Blekko
//
//  Created by Jordan Kay on 2/12/12.
//  Copyright (c) 2012 Laughing Sprout. All rights reserved.
//

#import <QSInterface/QSInterface.h>

typedef NSArray *(^ QSInterfaceControllerAsyncBlock)();

@interface QSInterfaceController (Async)

- (void)showArrayAsyncFromBlock:(QSInterfaceControllerAsyncBlock)arrayBlock;

@end
