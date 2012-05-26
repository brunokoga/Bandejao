//
//  UIScrollView+GotoIndex.m
//  Bandejao
//
//  Created by Bruno Koga on 5/26/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "UIScrollView+GotoIndex.h"

@implementation UIScrollView (GotoIndex)

- (void)showViewAtIndex:(int)index
               animated:(BOOL)animated
{
    CGRect frame = self.frame;
    frame.origin.x = frame.size.width * index;
    frame.origin.y = 0;
    [self scrollRectToVisible:frame animated:animated];
}

- (void)showViewAtIndex:(int)index
{
    [self showViewAtIndex:index animated:YES];
    
}

@end
