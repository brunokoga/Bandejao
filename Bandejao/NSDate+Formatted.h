//
//  NSDate+Formatted.h
//  Bandejao
//
//  Created by Bruno Koga on 5/14/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Formatted)

- (NSString*)dateStringWithFormat:(NSString*)format;
- (NSString*)dateStringWithDefaultFormat;

@end
