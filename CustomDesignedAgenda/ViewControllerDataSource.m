//
//  ViewControllerDataSource.m
//  CustomDesignedAgenda
//
//  Created by Joshua Howland on 3/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewControllerDataSource.h"
#import "AvatarView.h"
#import "EventCell.h"

@implementation ViewControllerDataSource 

- (void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[EventCell class] forCellReuseIdentifier:NSStringFromClass([EventCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EventCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EventCell class]) forIndexPath:indexPath];
    
    [cell updateWithTime:@"6:15 PM"
                   title:@"Dinner with Melissa"
            locationName:@"Pago"
                  avatar:[UIImage imageNamed:@"avatar"]];
    
//    UITableViewCell *cell = [UITableViewCell new];


//    AvatarView *avatarView = [[AvatarView alloc] initWithFrame:CGRectMake(16, 0, 44, 44)];
//    UIImage *image = [UIImage imageNamed:@"avatar"];
//    [avatarView setImage:image];
//    
//    [cell.contentView addSubview:avatarView];
//
    return cell;
}

@end
