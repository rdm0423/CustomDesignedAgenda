//
//  ViewControllerDataSource.m
//  CustomDesignedAgenda
//
//  Created by Joshua Howland on 3/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewControllerDataSource.h"
#import "AvatarView.h"

@implementation ViewControllerDataSource 

- (void)registerTableView:(UITableView *)tableView {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];


    AvatarView *avatarView = [[AvatarView alloc] initWithFrame:CGRectMake(16, 0, 44, 44)];
    UIImage *image = [UIImage imageNamed:@"avatar"];
    [avatarView setImage:image];
    
    [cell.contentView addSubview:avatarView];

    return cell;
}

@end
