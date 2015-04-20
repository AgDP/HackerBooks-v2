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
    cell.textLabel.text = nb.name;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [nb.notes count]];
    
    // Devolverla
    return cell;
    
    
}

/*
-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        
        // Inmediatamente lo elimino del modelo
        
        // Averiguar la libreta
        AGTNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        // Eliminarla
        [self.fetchedResultsController.managedObjectContext deleteObject:nb];
        
    }
    
}
*/

/*
#pragma mark - Table Delegate
-(void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar la libreta
    ADPAnnotation *n = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear un contorlador de notas
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AGTNote entityName]];
    req.sortDescriptors = @[[NSSortDescriptor
                             sortDescriptorWithKey:ADPAnnotationAttributes.name
                             ascending:YES
                             selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor
                             sortDescriptorWithKey:ADPAnnotationAttributes.modificationDate
                             ascending:NO]];
    req.fetchBatchSize = 20;
    
    req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@", n];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc]
                                      initWithFetchRequest:req
                                      managedObjectContext:n.managedObjectContext
                                      sectionNameKeyPath:nil cacheName:nil];
    
    
    AGTNotesViewController *nVC = [[AGTNotesViewController alloc]
                                   initWithFetchedResultsController:fc
                                   style:UITableViewStylePlain
                                   notebook:n];
    
    // Hacer un push
    [self.navigationController pushViewController:nVC
                                         animated:YES];
    
}
 */


#pragma mark - Utils
-(void) addNewNotebookButton{
    
    UIBarButtonItem *add = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                            target:self action:@selector(addNewAnnotation:)];
    
    self.navigationItem.rightBarButtonItem = add;
    
}


#pragma mark -  Actions
-(void) addNewAnnotation:(id) sender{
    
    //[ADPAnnotation notebookWithName:@"New Annotation"
     //                     context:self.fetchedResultsController.managedObjectContext];
    
}



@end
