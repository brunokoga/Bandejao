//
//  NSDate+Formatted.m
//  Bandejao
//
//  Created by Bruno Koga on 5/14/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "NSDate+Formatted.h"

@implementation NSDate (Formatted)

- (NSString*)dateStringWithFormat:(NSString*)format
{
    //format the date using the format
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    //returns
    return [formatter stringFromDate:self];
    
}

- (NSString*)dateStringWithDefaultFormat
{
    return [self dateStringWithFormat:@"dd/MM/YYYY"];
}






@end
