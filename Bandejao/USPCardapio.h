//
//  USPCardapio.h
//  Bandejao
//
//  Created by Bruno Koga on 5/12/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USPRefeicao.h"

@interface USPCardapio : NSObject

@property (strong) NSString *diaSemana;
@property (strong) NSString *data;
@property (strong) USPRefeicao *almoco;
@property (strong) USPRefeicao *jantar;


@end
