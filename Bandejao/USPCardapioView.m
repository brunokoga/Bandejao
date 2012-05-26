//
//  USPCardapioView.m
//  Bandejao
//
//  Created by Bruno Koga on 5/26/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPCardapioView.h"

@implementation USPCardapioView
@synthesize DiaDaSemanaLabel;
@synthesize dataLabel;
@synthesize almocoSaladaLabel;
@synthesize almocoAcompanhamentoLabel;
@synthesize almocoPrincipalLabel;
@synthesize almocoSobremesaLabel;
@synthesize jantarSaladaLabel;
@synthesize jantarAcompanhamentoLabel;
@synthesize jantarPrincipalLabel;
@synthesize jantarSobremesaLabel;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setCardapio:(USPCardapio*)cardapio
{
    self.DiaDaSemanaLabel.text = cardapio.diaSemana;
    self.dataLabel.text = cardapio.data;
    
    self.almocoSaladaLabel.text = cardapio.almoco.salada;
    [[self almocoAcompanhamentoLabel] setText:[[cardapio almoco] acompanhamento]];
    self.almocoPrincipalLabel.text = cardapio.almoco.principal;
    self.almocoSobremesaLabel.text = cardapio.almoco.sobremesa;
    
    self.jantarSaladaLabel.text = cardapio.jantar.salada;
    self.jantarPrincipalLabel.text = cardapio.jantar.principal;
    self.jantarAcompanhamentoLabel.text = cardapio.jantar.acompanhamento;
    self.jantarSobremesaLabel.text = cardapio.jantar.sobremesa;
    
}

@end
