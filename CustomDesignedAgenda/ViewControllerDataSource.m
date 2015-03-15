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
    
    [tableView registerClass:[EventTableViewCell class] forCellReuseIdentifier:NSStringFromClass([EventTableViewCell class])];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([EventTableViewCell class])];

    [cell updateWithTime:@"6:15 PM" Title:@"Dinner with Melissa" locationName:@"CAFE TRIO" avatar:[UIImage imageNamed:@"avatar"]];
    
    return cell;
}

@end
