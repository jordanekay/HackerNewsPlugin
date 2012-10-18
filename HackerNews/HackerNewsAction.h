//
//  HackerNewsAction.h
//  HackerNews
//
//  Created by Jordan Kay on 7/23/12.
//

@interface HackerNewsAction : QSActionProvider

- (QSObject *)viewArticle:(QSObject *)story;
- (QSObject *)viewComments:(QSObject *)story;

@end
