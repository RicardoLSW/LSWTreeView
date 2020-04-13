//
//  LSWTreeViewDataModel.m
//  chl-exhibit-ios
//
//  Created by Ricardo on 2020/4/10.
//  Copyright © 2020 Ricardo. All rights reserved.
//

#import "LSWTreeViewDataModel.h"

@implementation LSWTreeViewDataModel

- (instancetype)initWithParams:(NSDictionary *)params
{
    self = [super init];
    if (self) {
        _parentId = params[@"parentId"] ? params[@"parentId"] : @"-1";
        _currentId = params[@"currentId"];
        _name = params[@"name"];
        _expand = NO;
        _children = params[@"children"];
        _level = params[@"level"] ? [params[@"level"] integerValue] : 1;
    }
    return self;
}


@end
