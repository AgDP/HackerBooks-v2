//
//  ADPBooksViewController.m
//  HackerBook-v2
//
//  Created by Agustín on 15/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "ADPBooksViewController.h"
#import "ADPBook.h"
#import "ADPLibraryViewController.h"
#import "ADPPhoto.h"
#import "ADPTag.h"
#import "ADPSimplePDFViewController.h"

@interface ADPBooksViewController ()

@end

@implementation ADPBooksViewController

-(id) initWithModel:(ADPBook *) model{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        _model = model;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photo.image = [self.model.photo image];
    self.authors.text = self.model.authorsWithNameAndSeparate;
    self.tags.text = self.model.tagsWithNameAndSeparate;
    
    //Muestro los campos
    
    //[self showDataInView];
    
    
    
    //Detectamos el tipo de pantalla
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        [self.authors setFont:[UIFont fontWithName:@"Arial" size:10]];
        [self.tags setFont:[UIFont fontWithName:@"Arial" size:10]];
        
    }
    
    //[self hiddenPortada];
    
    
    
    if (self.model.isFavorite  != 0) {
        UIImage *butYe = [[UIImage imageNamed:@"starYe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.favorite setImage:butYe forState:UIControlStateNormal];
    }else{
        //Añado la imagen al boton
        UIImage *butBla = [[UIImage imageNamed:@"starBla.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.favorite setImage:butBla forState:UIControlStateNormal];
    }
    
    //Si estoy dentro de un SpliVC me pongo el botón
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate
-(void) libraryTableViewController:(ADPLibraryViewController *)library didSelectedBook:(ADPBook *)book{
    
    //Actualizo el modelo
    self.model = book;
    
    //Muestro los campos
    //[self showDataInView];
    
    //sync modelo y vista
    
    if (self.model.isFavoriteValue) {
        UIImage *butYe = [[UIImage imageNamed:@"starYe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.favorite setImage:butYe forState:UIControlStateNormal];
    }else{
        //Añado la imagen al boton
        UIImage *butBla = [[UIImage imageNamed:@"starBla.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.favorite setImage:butBla forState:UIControlStateNormal];
    }
    
    //[self hiddenPortada];
    
    self.photo.image = [self.model.photo image];
    self.authors.text = self.model.authorsWithNameAndSeparate;
    self.tags.text = self.model.tagsWithNameAndSeparate;
    
    //Actualizo el titulo del libro en el NavigationC
    self.title = self.model.title;
}


-(IBAction)displayPdf:(id)sender{
    
    // Crear un PDFVC
    ADPSimplePDFViewController *pdfVC = [[ADPSimplePDFViewController alloc]
                                         initWithModel:self.model];
    // Hacer un push
    [self.navigationController pushViewController:pdfVC
                                         animated:YES];
    
}

-(IBAction)markFavorite:(id)sender{
    
    UIButton *button = (UIButton *)sender;
    ADPBook *book = self.model;
    
    if (!book.isFavoriteValue) {
        UIImage *butYe = [[UIImage imageNamed:@"starYe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [button setImage:butYe forState:UIControlStateNormal];
        self.model.isFavoriteValue = YES;
    }else{
        //Añado la imagen al boton
        UIImage *butBla = [[UIImage imageNamed:@"starBla.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [button setImage:butBla forState:UIControlStateNormal];
        book.isFavoriteValue = NO;
    }

    NSMutableSet *tagsSet = [book.tags mutableCopy];
    ADPTag *tag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag"
                                                inManagedObjectContext:book.managedObjectContext];
    tag.name = @"Favorite";
    [tagsSet addObject:tag];
    book.tags = tagsSet;
#warning Falla al guardar el objeto ****************************************
    NSError *error;
    BOOL saved = [book.managedObjectContext save:&error];
    
    
   //Este es mi método de inicialización de Tags pero falla igual si le llamo
   //[ADPTag addTagWithNames:@"Favorite" context:book.managedObjectContext book: book];
    //NSError *error;
    //BOOL saved = [book.managedObjectContext save:&error];
    
    
    
    
    
    
    
    
    
    
    /*
    // Buscar
    //Busco los tags
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSError *error;
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"name == %@", @"Favorite"]];
    NSArray *results = [book.managedObjectContext executeFetchRequest:fetch error:&error];
    
    ADPTag * tag = [results lastObject];
    
    NSLog(@"Tag: %@",results);
    NSMutableSet *set = [[NSMutableSet alloc] init];
    [set addObject:book];

    
    tag.books = set;
    
    BOOL saved = [book.managedObjectContext save:&error];
    
    //[book.managedObjectContext deleteObject:[results lastObject]];
    //NSError *error;
    //[book.managedObjectContext save:&error];
    */
}

@end
