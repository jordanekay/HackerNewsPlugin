//
//  HackerNewsAction.m
//  HackerNews
//
//  Created by Jordan Kay on 7/23/12.
//

#import "HackerNewsAction.h"
#import "HackerNewsHandler.h"

@implementation HackerNewsAction

- (QSObject *)browse:(QSObject *)section
{
    QSInterfaceControllerAsyncBlock arrayBlock = [[HackerNewsHandler sharedHandler] topStoriesBlock];
    [[QSReg preferredCommandInterface] showArrayAsyncFromBlock:arrayBlock];
    
    return nil;
}

- (QSObject *)viewArticle:(QSObject *)story
{
    NSURL *articleURL = [NSURL URLWithString:[story name]];
    [[NSWorkspace sharedWorkspace] openURL:articleURL];
    
    return nil;
}

- (QSObject *)viewComments:(QSObject *)story
{
    NSString *commentsURLString = [NSString stringWithFormat:kHackerNewsRoot, [story identifier]];
    NSURL *commentsURL = [NSURL URLWithString:commentsURLString];
    [[NSWorkspace sharedWorkspace] openURL:commentsURL];
    
    return nil;
}

@end
