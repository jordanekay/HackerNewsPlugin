//
//  HackerNewsHandler.m
//  HackerNews
//
//  Created by Jordan Kay on 10/14/12.
//  Copyright (c) 2012 Twitter, Inc. All rights reserved.
//

#import "HackerNewsHandler.h"

static NSString *const kHackerNewsAPIRoot = @"http://hndroidapi.appspot.com/news/format/json/page/?appid=HackerNewsPlugin";
static NSString *const kHackerNewsStory   = @"HackerNewsStory";

static NSString *const kStoriesKey     = @"items";
static NSString *const kTitleKey       = @"title";
static NSString *const kURLKey         = @"items";
static NSString *const kDescriptionKey = @"description";

@implementation HackerNewsHandler

+ (HackerNewsHandler *)sharedHandler
{
    static dispatch_once_t once;
    static HackerNewsHandler *sharedHandler;
    dispatch_once(&once, ^{ 
        sharedHandler = [[self alloc] init]; 
    });
    return sharedHandler;
}

- (QSInterfaceControllerAsyncBlock)topStoriesBlock
{
    return [[^{
        return [self topStories];
    } copy] autorelease];
}

- (NSArray *)topStories
{
    NSURL *url = [NSURL URLWithString:kHackerNewsAPIRoot];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *resultsDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]; 
    NSArray *storyDictionaries = [resultsDictionary objectForKey:kStoriesKey];
    
    NSMutableArray *results = [NSMutableArray array];
    for(NSDictionary *d in storyDictionaries) {
        NSString *title = [d objectForKey:kTitleKey];
        NSString *url = [d objectForKey:kURLKey];
        NSString *description = [d objectForKey:kDescriptionKey];
        QSObject *story = [QSObject objectWithName:title];
        [story setObject:description forType:kHackerNewsStory];
        [story setIdentifier:url];
        [story setLabel:title];
        [story setPrimaryType:kHackerNewsStory];
        [results addObject:story];
    }
    return results;
}

@end
