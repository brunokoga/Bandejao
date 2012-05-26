//
//  USPCardapio.m
//  Bandejao
//
//  Created by Bruno Koga on 5/12/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPCardapio.h"

@implementation USPCardapio

@synthesize diaSemana, data, almoco, jantar;

- (id)initWithDiaSemana:(NSString*)_diaSemana
                   data:(NSString*)_data
                 almoco:(USPRefeicao*)_almoco
                 jantar:(USPRefeicao*)_jantar
{
    self = [super init];
    if (self) {
        self.diaSemana = _diaSemana;
        self.data = _data;
        self.almoco = _almoco;
        self.jantar = _jantar;
    }
    return self;
}
@end
