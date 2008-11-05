//
//  BlueBadge.m
//
//  Copyright 2008 Stepcase Limited.
//

#import <UIKit/UIKit.h>


@interface BlueBadge : UIView {
	NSInteger count;
}

@property (nonatomic) NSInteger count;

- (void)drawWithCount:(NSInteger)i;

@end
