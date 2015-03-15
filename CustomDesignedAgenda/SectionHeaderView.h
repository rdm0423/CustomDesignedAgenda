//
//  SectionHeader.h
//  CustomDesignedAgenda
//
//  Created by Joshua Howland on 3/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SectionHeaderView : UIView

+ (CGFloat)headerHeight;

- (void)updateWithDate:(NSString *)dateString title:(NSString *)title;

@end
