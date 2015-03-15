//
//  SectionHeader.m
//  CustomDesignedAgenda
//
//  Created by Joshua Howland on 3/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "SectionHeaderView.h"

const CGFloat margin = 25;

@interface SectionHeaderView ()

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SectionHeaderView

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
    
        self.backgroundColor = [UIColor colorWithRed:139.0/255.0 green:209.0/255.0 blue:223.0/255.0 alpha:1.0];
        
        self.dateLabel = [UILabel new];
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.dateLabel];
        
        self.dateLabel.font = [UIFont boldSystemFontOfSize:17];
        self.dateLabel.textColor = [UIColor whiteColor];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:self.titleLabel];

        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = [UIColor whiteColor];
     
        // Make a dictionary of all the views you need to lay out
        NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_dateLabel, _titleLabel);
        
        // Space everything out by default spaces
        NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[_dateLabel]-[_titleLabel(>=20)]-|" options:0 metrics:nil views:viewsDictionary];
        NSArray *verticalConstraintsDate = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_dateLabel]|" options:0 metrics:nil views:viewsDictionary];
        NSArray *verticalConstraintsTitle = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_titleLabel]|" options:0 metrics:nil views:viewsDictionary];
        
        // Add the constraint to the common ancestor of all the views you want to lay out
        [self addConstraints:constraints];
        [self addConstraints:verticalConstraintsDate];
        [self addConstraints:verticalConstraintsTitle];
        
    }
    return self;
    
}

+ (CGFloat)headerHeight {
    return 30;
}

- (void)updateWithDate:(NSString *)dateString title:(NSString *)title {
    self.dateLabel.text = dateString;
    self.titleLabel.text = title;
}

@end
