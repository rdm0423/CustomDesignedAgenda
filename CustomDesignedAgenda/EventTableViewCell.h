//
//  EventTableViewCell.h
//  CustomDesignedAgenda
//
//  Created by Joshua Howland on 3/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventTableViewCell : UITableViewCell

+ (CGFloat)height;

- (void)updateWithTime:(NSString *)time Title:(NSString *)title locationName:(NSString *)locationName avatar:(UIImage *)avatar;

@property (nonatomic) BOOL drawsSeparator;

@end
