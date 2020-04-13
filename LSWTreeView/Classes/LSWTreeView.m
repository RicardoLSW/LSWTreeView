//
//  LSWTreeView.m
//  chl-exhibit-ios
//
//  Created by 骆顺旺 on 2020/4/10.
//  Copyright © 2020 骆顺旺. All rights reserved.
//

#import "LSWTreeView.h"
#import "LSWTreeViewDataModel.h"

@interface LSWTreeView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) NSMutableArray *tempData;
@property (nonatomic, assign) NSUInteger count;

@end

@implementation LSWTreeView

static NSString *const cellId = @"cellId";

- (instancetype)initWithData:(NSArray *)data frame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.data = data;
        self.tempData = [self createData:data];
        self.delegate = self;
        self.dataSource = self;
        self.count = 0;
//        self.backgroundColor = APP_COLOR;
    }
    return self;
}

- (NSMutableArray *)createData:(NSArray *)data {
    NSMutableArray *arr = [NSMutableArray array];
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @autoreleasepool {
            LSWTreeViewDataModel *model = [[LSWTreeViewDataModel alloc] initWithParams:obj];
            [arr addObject:model];
        };
    }];
    return arr;
}

#pragma mark - UITableViewDataSource

///渲染cell数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    LSWTreeViewDataModel *model = self.tempData[indexPath.row];
    NSMutableString *name = [NSMutableString string];
    for (int i = 0; i < model.level; ++i) {
        [name appendString:@"    "];
    }
    [name appendString:model.name];
    cell.textLabel.text = name;
//    cell.backgroundColor = APP_COLOR;
//    cell.textLabel.textColor = TEXT_COLOR;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

///cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tempData.count;
}

///分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDelegate

///点击某个cell数据传出去
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LSWTreeViewDataModel *parentModel = self.tempData[indexPath.row];
    parentModel.expand = !parentModel.expand;
    NSArray *arr = parentModel.children;
    NSUInteger start = indexPath.row + 1;
    __block NSUInteger end = start;
    __block BOOL expand = NO;
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @autoreleasepool {
            LSWTreeViewDataModel *model = [[LSWTreeViewDataModel alloc] initWithParams:obj];
            if (model.parentId == parentModel.currentId) {
                if (parentModel.expand) {
                    model.level = 1 + parentModel.level;
                    [self.tempData insertObject:model atIndex:end];
                    expand = YES;
                } else {
                    end = [self removeAllNodesAtParentModel:parentModel index:indexPath.row];
                    expand = NO;
                    *stop = YES;
                }
                end++;
            }
        }
    }];
    
    NSMutableArray *indexPathArr = [NSMutableArray array];
    for (NSUInteger i = start; i< end; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexPathArr addObject:indexPath];
    }
    
    if (expand) {
        [self insertRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationNone];
    } else {
        [self deleteRowsAtIndexPaths:indexPathArr withRowAnimation:UITableViewRowAnimationNone];
    }
    
    self.count = 0;
}

///cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSUInteger)removeAllNodesAtParentModel:(LSWTreeViewDataModel *)parentModel index:(NSUInteger)index{
    NSUInteger start = index;
    __block NSUInteger end = start;
    NSArray *arr = parentModel.children;
    NSUInteger count = [self getExtendCount:arr];
    end += count;
    if (end > start) {
        [self.tempData removeObjectsInRange:NSMakeRange(start + 1, count)];
    }
    return end;
}

- (NSUInteger)getExtendCount:(NSArray *)arr {
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        @autoreleasepool {
            LSWTreeViewDataModel *m = [[LSWTreeViewDataModel alloc] initWithParams:obj];
            [self.tempData enumerateObjectsUsingBlock:^(id  _Nonnull obj2, NSUInteger idx, BOOL * _Nonnull stop2) {
                LSWTreeViewDataModel *m2 = obj2;
                if ([m.currentId isEqualToString:m2.currentId]) {
                    self.count++;
                    *stop2 = YES;
                }
            }];
            if (m.children.count > 0) {
                [self getExtendCount:m.children];
            }
        }
    }];
    return self.count;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
