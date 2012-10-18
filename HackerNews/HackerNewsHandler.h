//
//  HackerNewsHandler.h
//  HackerNews
//
//  Created by Jordan Kay on 10/14/12.
//  Copyright (c) 2012 Twitter, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "QSInterfaceController+Async.h"

extern NSString *const kHackerNewsRoot;

@interface HackerNewsHandler : NSObject

+ (HackerNewsHandler *)sharedHandler;
- (NSArray *)topStories;
- (QSInterfaceControllerAsyncBlock)topStoriesBlock;

@end
