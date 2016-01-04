//
//  HUCustomDataSource.m
//  SportTimer
//
//  Created by mac on 16/1/4.
//  Copyright (c) 2016年 jinhuadiqigan. All rights reserved.
//

#import "HUCustomDataSource.h"

@interface HUCustomDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *identifer;
@property (nonatomic, copy) ConfigureCell cellBlock;

@end
@implementation HUCustomDataSource

- (id)initWithItems:(NSArray *)items cellIdentifer:(NSString *)identifer configureCellBlock:(ConfigureCell)block {
    self = [super init];
    if (self) {
        _items = items;
        _identifer = [identifer copy];
        _cellBlock = [block copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    if (!_items)
        return 0;
    
    return self.items[(NSInteger)indexPath.row];
}
#pragma mark tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"row:%zd", self.items.count);
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_identifer forIndexPath:indexPath];
    
    id item = [self itemAtIndexPath:indexPath];
    _cellBlock(cell, item);
    
    return cell;
}


@end
