//
//  ADPBooksViewController.m
//  HackerBook-v2
//
//  Created by Agustín on 15/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "ADPLibraryViewController.h"
#import "ADPBook.h"
#import "ADPTag.h"
#import "ADPPhoto.h"
#import "ADPBooksViewController.h"

@interface ADPLibraryViewController ()

@end

@implementation ADPLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Books";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
#warning Esto se repite mucho ponerlo fuera
    //Busco los tags
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSError *error;
    NSArray *results = [self.fetchedResultsController.managedObjectContext executeFetchRequest:fetch error:&error];
    
    return results.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //Busco los tags
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSError *error;
    NSArray *results = [self.fetchedResultsController.managedObjectContext executeFetchRequest:fetch error:&error];
    
    ADPTag *tag = [results objectAtIndex:section];
    
    NSInteger count = tag.books.count;
    
    return count;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    //Busco los tags
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSError *error;
    NSArray *results = [self.fetchedResultsController.managedObjectContext executeFetchRequest:fetch error:&error];
    
   return [[results objectAtIndex:section] name];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
    //Busco los tags
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSError *error;
    NSArray *results = [self.fetchedResultsController.managedObjectContext executeFetchRequest:fetch error:&error];
    
    ADPTag *tag = [results objectAtIndex:indexPath.section];
    
    ADPBook *book = [[tag.books allObjects] objectAtIndex:indexPath.row];
    
     // Averiguar cual es el libro
    //ADPBook *book = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    // Crear una celda
    static NSString *cellID = @"notebookCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellID];
    }
    
    // Configurarla (sincronizar libreta -> celda)
    cell.imageView.image = [book.photo image];
    cell.textLabel.text = book.title;
    cell.detailTextLabel.text = book.authorsWithNameAndSeparate;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Devolverla
    return cell;
    
    
}


#pragma mark - Delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //Obtener el book seleccionado
    //ADPBook *book = [self.fetchedResultsController.fetchedObjects objectAtIndex:indexPath.row];
    
    //Busco los tags
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    NSError *error;
    NSArray *results = [self.fetchedResultsController.managedObjectContext executeFetchRequest:fetch error:&error];
    
    ADPTag *tag = [results objectAtIndex:indexPath.section];
    
    ADPBook *book = [[tag.books allObjects] objectAtIndex:indexPath.row];
    
    //Avisar al delegado siempre y cuando entienda el mensaje
    if ([self.delegate respondsToSelector:@selector(libraryTableViewController:didSelectedBook:)])  {
        
        //te lo mando
        [self.delegate libraryTableViewController:self didSelectedBook:book];
    }
    /*
    // mandamos una notificacion
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSDictionary *dict = @{NOTIFICATION_SELECT_BOOK_LIBRARY_KEY : book};
    
    NSNotification *n = [NSNotification notificationWithName:NOTIFICATION_SELECT_BOOK_LIBRARY_NAME object:self userInfo:dict];
    
    [nc postNotification:n];
    */
}

//Protocol
-(void) libraryTableViewController: (ADPLibraryViewController *)library didSelectedBook: (ADPBook *)book{
    
    //Creamos un book
    ADPBooksViewController *bookController = [[ADPBooksViewController alloc] initWithModel:book];
    
    //Hago un push
    [self.navigationController pushViewController:bookController animated:YES];
    
}

@end
