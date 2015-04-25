//
//  ADPAnnotationViewController.m
//  HackerBook-v2
//
//  Created by Agustín on 20/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "ADPAnnotationViewController.h"
#import "ADPAnnotation.h"
#import "ADPPhotoViewController.h"
#import "ADPPhoto.h"
#import "ADPAnnotationsViewController.h"

@interface ADPAnnotationViewController ()

@end

@implementation ADPAnnotationViewController

#pragma mark - Init
-(id) initWithModel:(ADPAnnotation *) model andContext: (NSManagedObjectContext *) context{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
        _context = context;
    }
    
    return self;
}


-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Asignamos delegados
    //self.nameView.delegate = self;
    
    // Alta en notificaciones de teclado
    //[self setupKeyboardNotifications];
    
    
    // Sincornizar modelo -> Vista
    
    // Fechas
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    
    self.creationDateView.text = [fmt stringFromDate:self.model.creationDate];
    self.modificationDateView.text = [fmt stringFromDate:self.model.modificationDate];
    
    // Nombre
    self.title = self.model.name;
    
    self.titleAnnotation.text = self.model.name;
    // Texto
    self.textView.text = self.model.text;
    
    //Photo
    self.photoView.image = self.model.photo.image;
    
}


-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Baja en notificaciones
    //[self tearDownKeyboardNotifications];
    
    // Sincronizo vistas -> Modelo
    
    self.model.name = self.titleAnnotation.text;
    self.model.text = self.textView.text;
}



#pragma mark - Actions
- (IBAction)displayPhoto:(id)sender {
  
    //Creamos el controlador
    ADPPhotoViewController *pVc = [[ADPPhotoViewController alloc]initWithModel:self.model.photo andAnnotation:self.model andContext:self.context];
    
    //Push
    [self.navigationController pushViewController:pVc animated:YES];
   
}

- (IBAction)displayShare:(id)sender{
    
}

- (IBAction)displayRemove:(id)sender{
    
    [self.context deleteObject:self.model];
    
    
    //Me muevo al controlador por encima
    //Buscar una forma mejor de hacer esto
    
}



@end
