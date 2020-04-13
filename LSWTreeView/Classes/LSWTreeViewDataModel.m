//
//  LSWTreeViewDataModel.m
//  chl-exhibit-ios
//
//  Created by 骆顺旺 on 2020/4/10.
//  Copyright © 2020 骆顺旺. All rights reserved.
//

#import "LSWTreeViewDataModel.h"

@implementation LSWTreeViewDataModel

- (instancetype)initWithParams:(NSDictionary *)params
{
    self = [super init];
    if (self) {
        _parentId = params[@"parentId"] ? params[@"parentId"] : @-1;
        _currentId = params[@"currentId"];
        _name = params[@"name"];
        _expand = params[@"expend"] ? params[@"expend"] : NO;
        _children = params[@"children"];
        _level = params[@"level"] ? [params[@"level"] integerValue] : 1;
    }
    return self;
}

//- (NSString *)description
//{
//    return [self modelToJSONString];
//}

@end
