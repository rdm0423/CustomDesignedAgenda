//
//  AvatarView.m
//  CustomDesignedAgenda
//
//  Created by Joshua Howland on 3/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "AvatarView.h"

@interface AvatarView ()

@property (nonatomic, strong) CAShapeLayer *circleLayer;

@end

@implementation AvatarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        self.layer.masksToBounds = YES;
        
        _circleLayer = [CAShapeLayer layer];
        _circleLayer.strokeColor = [UIColor whiteColor].CGColor;
        _circleLayer.lineWidth = 1.0;
        _circleLayer.fillColor = [UIColor clearColor].CGColor;

        // By inserting the _circleLayer at the top, you can add the stroke above the image
        [self.layer insertSublayer:_circleLayer atIndex:(unsigned int)self.layer.sublayers.count];

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self updateRadius:self.bounds];
}

- (void)updateRadius:(CGRect)rect {
    
    self.layer.cornerRadius = MAX(CGRectGetHeight(rect), CGRectGetWidth(rect)) / 2.0f;
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGRect zeroRectWithSize = { CGPointZero, rect.size };
    CGPathAddEllipseInRect(circlePath, NULL, zeroRectWithSize);
    _circleLayer.path = circlePath;
    
    CGPathRelease(circlePath);
}

@end
