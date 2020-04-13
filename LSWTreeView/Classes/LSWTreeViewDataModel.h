//
//  LSWTreeViewDataModel.h
//  chl-exhibit-ios
//
//  Created by 骆顺旺 on 2020/4/10.
//  Copyright © 2020 骆顺旺. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSWTreeViewDataModel : NSObject

@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *currentId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL expand;
@property (nonatomic, strong) NSArray *children;
@property (nonatomic) NSUInteger level;

- (instancetype)initWithParams:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
