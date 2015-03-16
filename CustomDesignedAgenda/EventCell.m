//
//  EventCell.m
//  CustomDesignedAgenda
//
//  Created by Ross McIlwaine on 3/16/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EventCell.h"
#import "AvatarView.h"

const CGFloat leftMargin = 50;

@interface EventCell ()

@property (nonatomic, strong) UIImageView *marker;

@property (nonatomic, strong) UILabel *eventTimeLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) AvatarView *avatarView;

@end

@implementation EventCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithRed:23.0/255.0 green:163.0/255.0 blue:191.0/255.0 alpha:1.0];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        UIImage *clock = [UIImage imageNamed:@"clock"];
        
        self.marker = [[UIImageView alloc] initWithFrame:CGRectMake(13, 25, clock.size.width, clock.size.height)];
        self.marker.image = clock;
        [self.contentView addSubview:self.marker];
        
        self.eventTimeLabel = [UILabel new];
        self.eventTimeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.eventTimeLabel];
        
        self.eventTimeLabel.font = [UIFont systemFontOfSize:16];
        self.eventTimeLabel.textColor = [UIColor whiteColor];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.titleLabel];
        
        self.titleLabel.font = [UIFont systemFontOfSize:29];
        self.titleLabel.textColor = [UIColor whiteColor];
        
        self.locationLabel = [UILabel new];
        self.locationLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.locationLabel];
        
        self.locationLabel.font = [UIFont systemFontOfSize:16];
        self.locationLabel.textColor = [UIColor whiteColor];
        
        self.avatarView = [AvatarView new];
        self.avatarView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:self.avatarView];
        
        NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_eventTimeLabel, _titleLabel, _locationLabel, _avatarView);
        
        NSArray *verticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-25-[_eventTimeLabel]-[_titleLabel]-[_locationLabel]-[_avatarView(==40)]-25-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:viewsDictionary];
        
        NSArray *horizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[_avatarView(==40)]-|" options:0 metrics:nil views:viewsDictionary];
        
        [self.contentView addConstraints:verticalConstraints];
        [self.contentView addConstraints:horizontalConstraints];
        
    }
    return self;
}

- (void)updateWithTime:(NSString *)time title:(NSString *)title locationName:(NSString *)locationName avatar:(UIImage *)avatar {
    
    self.eventTimeLabel.text = time;
    self.titleLabel.text = title;
    self.locationLabel.text = locationName;
    [self.avatarView setImage:avatar];
    
}

+ (CGFloat)height {
    return 190;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIColor *color = [UIColor colorWithWhite:1.0 alpha:0.2];
    [color setFill];
    [color setStroke];
    
    // Draw stripe on right
    CGRect sideLineRect = CGRectMake(CGRectGetMidX(self.marker.frame) - 1.5,
                                     CGRectGetMinY(self.bounds),
                                     3.0,
                                     CGRectGetHeight(self.bounds));
    [[UIBezierPath bezierPathWithRect:sideLineRect] fill];
    
//    if (self.drawsSeparator) {
        // Draw dotted line between cells
        UIBezierPath *dottedLine = [UIBezierPath bezierPath];
        dottedLine.lineWidth = 2.0;
        [dottedLine setLineDash:(CGFloat []){3.0, 1.0} count:2 phase:0.0];
        
        CGFloat leftX = CGRectGetMaxX(self.marker.frame) + 10.0;
        CGFloat rightX = CGRectGetMaxX(self.bounds) - 10.0;
        CGFloat bottomY = CGRectGetMaxY(self.bounds);
        [dottedLine moveToPoint:CGPointMake(leftX, bottomY)];
        [dottedLine addLineToPoint:CGPointMake(rightX, bottomY)];
        [dottedLine stroke];
//    }
}

@end
