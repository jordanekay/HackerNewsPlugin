//
//  HackerNewsSource.m
//  HackerNews
//
//  Created by Jordan Kay on 7/23/12.
//

#import "HackerNewsHandler.h"
#import "HackerNewsSource.h"

static NSString *const kHackerNewsSection = @"kHackerNewsSection";
static NSString *const kHackerNewsIcon    = @"kHackerNewsIcon";

static NSString *const kTopStories = @"Hacker News Top Stories";

@implementation HackerNewsSource

- (NSArray *)objectsForEntry:(NSDictionary *)entry
{
    QSObject *topStories = [QSObject objectWithName:kTopStories];
    [topStories setIdentifier:kTopStories];
    [topStories setObject:kTopStories forType:kHackerNewsSection];
    [topStories setPrimaryType:kHackerNewsSection];
    return [NSArray arrayWithObject:topStories];
}

- (BOOL)objectHasChildren:(QSObject *)object
{
    return YES;
}

- (BOOL)loadChildrenForObject:(QSObject *)object
{
    NSArray *stories = [[HackerNewsHandler sharedHandler] topStories];
    [object setChildren:stories];
    return YES;
}

- (NSImage *)iconForEntry:(NSDictionary *)entry
{
    return [QSResourceManager imageNamed:@"GenericNetworkIcon"];
}

- (void)setQuickIconForObject:(QSObject *)object
{
    [object setIcon:[QSResourceManager imageNamed:@"GenericNetworkIcon"]];
}

- (BOOL)loadIconForObject:(QSObject *)object
{
    [self setQuickIconForObject:object];
    return YES;
}

@end
