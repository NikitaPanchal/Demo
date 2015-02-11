//
//  SectionView.m
//  CustomTableTest
//
//  Created by Punit Sindhwani on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SectionView.h"
#import <QuartzCore/QuartzCore.h>


@implementation SectionView

@synthesize section;
@synthesize sectionTitle;
@synthesize discButton;
@synthesize delegate;

+ (Class)layerClass {
    
    return [CAGradientLayer class];
}

- (id)initWithFrame:(CGRect)frame WithTitle: (NSString *) title Section:(NSInteger)sectionNumber delegate: (id <SectionView>) Delegate
{
    self = [super initWithFrame:frame];
    if (self) {
   
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(discButtonPressed:)];
        [self addGestureRecognizer:tapGesture];
        self.userInteractionEnabled = YES;
        self.section = sectionNumber;
        self.delegate = Delegate;

        CGRect LabelFrame = self.bounds;
        LabelFrame.size.width -= 50;
        CGRectInset(LabelFrame, 0.0, 5.0);
        
        UILabel *label = [[UILabel alloc] initWithFrame:LabelFrame];
        label.text = title;
        label.font = [UIFont boldSystemFontOfSize:40.0];
        label.font =  [UIFont italicSystemFontOfSize:25.0];
        
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
       // label.textAlignment = UITextAlignmentLeft;
        [self addSubview:label];
        self.sectionTitle = label;
        
        CGRect buttonFrame = CGRectMake(LabelFrame.size.width, 0, 50, LabelFrame.size.height);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = buttonFrame;
        [button setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(discButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        self.discButton = button;

        static NSMutableArray *colors = nil;
        if (colors == nil) {
            colors = [[NSMutableArray alloc] initWithCapacity:3];
            UIColor *color = nil;
            color = [UIColor colorWithRed:218.0f/255.0f green:186.0f/255.0f blue:147.0f/255.0f alpha:1];
            [colors addObject:(id)[color CGColor]];
//            color = [UIColor colorWithRed:0.50 green:0.54 blue:0.58 alpha:1];
//            [colors addObject:(id)[color CGColor]];
//            color = [UIColor colorWithRed:0.15 green:0.20 blue:0.23 alpha:1];
//            [colors addObject:(id)[color CGColor]];
        }
        [(CAGradientLayer *)self.layer setColors:colors];
        [(CAGradientLayer *)self.layer setLocations:[NSArray arrayWithObjects:[NSNumber numberWithFloat:0.0], [NSNumber numberWithFloat:0.48], [NSNumber numberWithFloat:1.0], nil]];
    }
    return self;
}

- (void) discButtonPressed : (id) sender
{
    [self toggleButtonPressed:TRUE];
}

- (void) toggleButtonPressed : (BOOL) flag
{
    self.discButton.selected = !self.discButton.selected;
    if(flag)
    {
        if (self.discButton.selected)  
        {
            if ([self.delegate respondsToSelector:@selector(sectionOpened:)]) 
            {
                [self.delegate sectionOpened:self.section];
            }
        } else
        {
            if ([self.delegate respondsToSelector:@selector(sectionClosed:)]) 
            {
                [self.delegate sectionClosed:self.section];
            }
        }
    }
}

@end
