//
//  USPXMLParser.m
//  Bandejao
//
//  Created by Bruno Koga on 5/19/12.
//  Copyright (c) 2012 Ci&T. All rights reserved.
//

#import "USPXMLParser.h"

#define kALMOCO @"almoco"
#define kJANTAR @"jantar"
#define kSOBREMESA @"sobremesa"
#define kDATA @"data"
#define kACOMPANHAMENTO @"acompanhamento"
#define kPRINCIPAL @"principal"
#define kSALADA @"salada"

#define kSEGUNDA @"segunda"
#define kTERCA @"terca"
#define kQUARTA @"quarta"
#define kQUINTA @"quinta"
#define kSEXTA @"sexta"
#define kSABADO @"sabado"

@implementation USPXMLParser


- (NSArray*)arrayByParsingXML:(NSString*)xml
{
    NSMutableArray *objetos = [[NSMutableArray alloc] init];
    
    RXMLElement *rootXML = [RXMLElement elementFromXMLString:xml 
                                                    encoding:NSISOLatin1StringEncoding];
    
    
    NSArray *diasDaSemana = [NSArray arrayWithObjects:kSEGUNDA,
                             kTERCA,
                             kQUARTA,
                             kQUINTA,
                             kSEXTA,
                             kSABADO, nil];
    
    for (NSString *dia in diasDaSemana)
    {
        
        RXMLElement *diaElement = [rootXML child:dia];
        RXMLElement *data = [diaElement child:kDATA];
        
        
        RXMLElement *almocoElement = [diaElement child:kALMOCO];
        RXMLElement *almocoAcompanhamento = [almocoElement child:kACOMPANHAMENTO];
        RXMLElement *almocoPrincipal = [almocoElement child:kPRINCIPAL];
        RXMLElement *almocoSalada = [almocoElement child:kSALADA];
        RXMLElement *almocoSobremesa = [almocoElement child:kSOBREMESA];
        
        
        RXMLElement *jantarElement = [diaElement child:kJANTAR]; 
        RXMLElement *jantarAcompanhamento = [jantarElement child:kACOMPANHAMENTO];
        RXMLElement *jantarPrincipal = [jantarElement child:kPRINCIPAL];
        RXMLElement *jantarSalada = [jantarElement child:kSALADA];
        RXMLElement *jantarSobremesa = [jantarElement child:kSOBREMESA];
        
        
        USPRefeicao *almoco = [[USPRefeicao alloc] initWithSalada:[almocoSalada.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]
                                                        principal:[almocoPrincipal.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]
                                                   acompanhamento:[almocoAcompanhamento.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]
                                                        sobremesa:[almocoSobremesa.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
        
        USPRefeicao *jantar = [[USPRefeicao alloc] initWithSalada:[jantarSalada.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]
                                                        principal:[jantarPrincipal.text stringByReplacingOccurrencesOfString:@"\n" withString:@""] 
                                                   acompanhamento:[jantarAcompanhamento.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]
                                                        sobremesa:[jantarSobremesa.text stringByReplacingOccurrencesOfString:@"\n" withString:@""]];
        
        USPCardapio *cardapio = [[USPCardapio alloc] initWithDiaSemana:dia
                                                                  data:[data.text stringByReplacingOccurrencesOfString:@"\n" withString:@""] 
                                                                almoco:almoco
                                                                jantar:jantar];
        
        [objetos addObject:cardapio];
        
    }
    
    return (NSArray*)objetos;
}

@end
