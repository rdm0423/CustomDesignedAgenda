//
//  EventCell.h
//  CustomDesignedAgenda
//
//  Created by Ross McIlwaine on 3/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell

- (void)updateWithTime:(NSString *)time title:(NSString *)title locationName:(NSString *)locationName avatar:(UIImage *)avatar;

+ (CGFloat)height;

@end
