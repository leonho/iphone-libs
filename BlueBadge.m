//
//  BlueBadge.m
//
//  Copyright 2008 Stepcase Limited.
//

#import "BlueBadge.h"


@implementation BlueBadge

@synthesize count;

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
		[self setBackgroundColor: [UIColor clearColor]];
		[self setCount: 0];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	if (count == 0) return;
	NSString *countString = [NSString stringWithFormat: @"%d", count];
	UIFont *font = [UIFont boldSystemFontOfSize: 16];
	CGSize numberSize = [countString sizeWithFont: font];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	float radius = numberSize.height / 2.0;
	float startPoint = (rect.size.width - (numberSize.width + numberSize.height))/2.0;
	
	CGContextSetRGBFillColor(context, 0.55, 0.6, 0.70, 1.0);
	CGContextBeginPath(context);
	CGContextAddArc(context, startPoint + radius, radius, radius, M_PI / 2 , 3 * M_PI / 2, NO);
	CGContextAddArc(context, startPoint + radius + numberSize.width, radius, radius, 3 * M_PI / 2, M_PI / 2, NO);
	CGContextClosePath(context);
	CGContextFillPath(context);
	
	[[UIColor whiteColor] set];	
	[countString drawInRect: CGRectMake(startPoint + radius, rect.origin.y, rect.size.width, rect.size.height) withFont: font];
}

- (void)drawWithCount:(NSInteger)i {
	self.count = i;
	[self setNeedsDisplay];
}

- (void)dealloc {
    [super dealloc];
}


@end
