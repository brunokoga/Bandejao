//
//  USPXMLParser.h
//  Bandejao
//
//  Created by Bruno Koga on 5/19/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USPCardapio.h"
#import "USPRefeicao.h"
#import "RXMLElement.h"

@interface USPXMLParser : NSObject

- (NSArray*)arrayByParsingXML:(NSString*)xml;


@end
