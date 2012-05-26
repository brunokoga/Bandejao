//
//  USPRefeicao.m
//  Bandejao
//
//  Created by Bruno Koga on 5/12/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPRefeicao.h"

@implementation USPRefeicao

@synthesize salada, principal, acompanhamento, sobremesa;

- (id)initWithSalada:(NSString*)_salada
           principal:(NSString*)_principal
      acompanhamento:(NSString*)_acompanhamento
           sobremesa:(NSString*)_sobremesa
{
    self = [super init];
    if (self) {
        self.salada = _salada;
        self.principal = _principal;
        self.acompanhamento = _acompanhamento;
        self.sobremesa = _sobremesa;
    }
    return self;
}
@end
