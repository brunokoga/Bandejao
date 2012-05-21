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
                                                    encoding:NSUTF8StringEncoding];

    RXMLElement *sabado = [rootXML child:kSABADO];

    RXMLElement *sabadoAlmoco = [sabado child:kALMOCO];
    RXMLElement *sabadoJantar = [sabado child:kJANTAR];
    
    RXMLElement *sabadoSobremesa = [sabadoAlmoco child:@"sobremesa"];
    
    NSLog(@"%@", sabadoSobremesa.text);
    
    USPRefeicao *refeicao = [[USPRefeicao alloc] init];
    
    refeicao.sobremesa = sabadoSobremesa.text;

    return (NSArray*)objetos;
}

@end
