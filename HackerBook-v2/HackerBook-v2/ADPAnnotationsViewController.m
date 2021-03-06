//
//  ADPAnnotationsViewController.m
//  HackerBook-v2
//
//  Created by Agustín on 20/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "ADPAnnotationsViewController.h"
#import "ADPAnnotation.h"
#import "ADPBook.h"
#import "ADPPhoto.h"
#import "ADPAnnotationViewController.h"

@interface ADPAnnotationsViewController ()

@end

@implementation ADPAnnotationsViewController

-(id) initWithFetchedResultsController:(NSFetchedResultsController *)aFetchedResultsController
                                 style:(UITableViewStyle)aStyle
                              book:(ADPBook *) book{
    
    if (self = [super initWithFetchedResultsController:aFetchedResultsController
                                                 style:aStyle]) {
        _model = book;
        
        NSMutableString *title = [[NSMutableString alloc] init];
        [title appendString:book.title];
        [title appendString:@" - Annotations"];
        
        self.title = title;
    }
    return self;
}

-(void) viewDidLoad{
    [super viewDidLoad];
    //self.title = book.title;
    
    [self addNewNotebookButton];
    [self setupNotification];
    
    // Edit button
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar cual es la libreta
    ADPAnnotation *nb = [self.fetchedResultsController
                       objectAtIndexPath:indexPath];
    
    // Crear una celda
    static NSString *cellID = @"notebookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:cellID];
    }
    
    // Configurarla (sincronizar libreta -> celda)
    UIImage *image = [UIImage imageWithData:nb.photo.photoData];
    cell.textLabel.text = nb.name;
    cell.imageView.image = image;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Devolverla
    return cell;
    
    
}





-(void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // Averiguar la nota
    ADPAnnotation *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear el controlador
    ADPAnnotationViewController *nVC = [[ADPAnnotationViewController alloc] initWithModel:note andContext:self.fetchedResultsController.managedObjectContext];
    
    // Hacer el push
    [self.navigationController pushViewController:nVC
                                         animated:YES];
    
    
}

#pragma mark - Notification

-(void) setupNotification{
    
    // Alta en notificaciones de library
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatBookDidChange:)
               name:@"AGTBOOK_DID_CHANGE_NOTIFICATION"
             object:nil];
    
}

-(void) notifyThatBookDidChange:(NSNotification *) notification{
    
    
    // sacamos el nuevo libro
    ADPBook *newBook = [notification.userInfo objectForKey:@"BOOK"];
    self.model = newBook;
    [self syncWithModel];
    
}

-(void) syncWithModel{
    
    
    //Un fetchRequest
    NSFetchRequest *fetchReq = [NSFetchRequest fetchRequestWithEntityName:[ADPAnnotation entityName]];
    fetchReq.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ADPAnnotationAttributes.name ascending:YES selector:@selector(caseInsensitiveCompare:)]];
    fetchReq.fetchBatchSize = 20;
    fetchReq.predicate = [NSPredicate predicateWithFormat:@"book = %@", self.model];
    
    //FetchRequestController
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchReq managedObjectContext:self.model.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    self.fetchedResultsController = fc;

    
    NSMutableString *title = [[NSMutableString alloc] init];
    [title appendString:self.model.title];
    [title appendString:@" - Annotations"];
    
    self.title = title;
    
    [self.tableView reloadData];
}

#pragma mark - Utils
-(void) addNewNotebookButton{
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                            target:self action:@selector(addNewAnnotation:)];
    
    self.navigationItem.rightBarButtonItem = add;
    
}


#pragma mark -  Actions
-(void) addNewAnnotation:(id) sender{
    
    [ADPAnnotation annotationWithName:@"New annotation" book:self.model context:self.fetchedResultsController.managedObjectContext];
    
    NSError *error;
    [self.fetchedResultsController.managedObjectContext save:&error];

}



@end
