//
//  UIScrollView+GotoIndex.h
//  Bandejao
//
//  Created by Bruno Koga on 5/26/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (GotoIndex)

- (void)showViewAtIndex:(int)index;
- (void)showViewAtIndex:(int)index
               animated:(BOOL)animated;

@end
