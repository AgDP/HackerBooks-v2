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

    [self initializeSearchController];
    [self initializeTableContent];
    
    //Asigno las secciones
    [self.fetchedResultsController setValue:[self.fetchedResultsController fetchedObjects] forKey:@"sections"];
    
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ADPTag *tag = [[self.fetchedResultsController fetchedObjects] objectAtIndex:indexPath.section];

    ADPBook *book =[[tag.books allObjects] objectAtIndex:indexPath.row];

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
    
    
    ADPTag *tag = [[self.fetchedResultsController fetchedObjects] objectAtIndex:indexPath.section];
    ADPBook *book = [[tag.books allObjects] objectAtIndex:indexPath.row];
    
    //Avisar al delegado siempre y cuando entienda el mensaje
    if ([self.delegate respondsToSelector:@selector(libraryTableViewController:didSelectedBook:)])  {
        
        //te lo mando
        [self.delegate libraryTableViewController:self didSelectedBook:book];
    }
    
    // mandamos una notificacion para el PDF
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSDictionary *dict = @{@"BOOK" : book};
    
    NSNotification *n = [NSNotification notificationWithName:@"AGTBOOK_DID_CHANGE_NOTIFICATION" object:self userInfo:dict];
    
    [nc postNotification:n];
    
}

//Protocol
-(void) libraryTableViewController: (ADPLibraryViewController *)library didSelectedBook: (ADPBook *)book{
    
    //Creamos un book
    ADPBooksViewController *bookController = [[ADPBooksViewController alloc] initWithModel:book];
    
    //Hago un push
    [self.navigationController pushViewController:bookController animated:YES];
    
}

/*
//Notificación cambio en favoritos
-(void) notifyThatBookDidChange: (NSNotification *) notification{
    
 
    //Sacamos el personaje
    ADPBook *book = [notification.userInfo objectForKey:@"bookFavorite"];
    
    //Actualizamos el modelo
    self.model = book;
    
    //Sincronizamos modelo -> vista
    [self syncModelWithView];
 
    
    [self.tableView reloadData];
}
*/

#pragma mark - Initialization methods

- (void)initializeTableContent {
    
    //sections are defined here as a NSArray of string objects (i.e. letters representing each section)
    self.tableSections = [[ADPTag fetchDistinctItemGroupsInManagedObjectContext:self.fetchedResultsController.managedObjectContext] mutableCopy];
    
    //sections and items are defined here as a NSArray of NSDictionaries whereby the key is a letter and the value is a NSArray of string opbjects of names
    self.tableSectionsAndItems = [[ADPTag fetchItemNamesByGroupInManagedObjectContext:self.fetchedResultsController.managedObjectContext] mutableCopy];
}

- (void)initializeSearchController {
    
    //instantiate a search results controller for presenting the search/filter results (will be presented on top of the parent table view)
    UITableViewController *searchResultsController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    searchResultsController.tableView.dataSource = self;
    
    searchResultsController.tableView.delegate = self;
    
    //instantiate a UISearchController - passing in the search results controller table
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    //this view controller can be covered by theUISearchController's view (i.e. search/filter table)
    self.definesPresentationContext = YES;
    
    
    //define the frame for the UISearchController's search bar and tint
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    self.searchController.searchBar.tintColor = [UIColor whiteColor];
    
    //add the UISearchController's search bar to the header of this table
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    
    //this ViewController will be responsible for implementing UISearchResultsDialog protocol method(s) - so handling what happens when user types into the search bar
    self.searchController.searchResultsUpdater = self;
    
    
    //this ViewController will be responsisble for implementing UISearchBarDelegate protocol methods(s)
    self.searchController.searchBar.delegate = self;
}

#pragma mark - UISearchResultsUpdating

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    //get search text from user input
    NSString *searchText = [self.searchController.searchBar text];
    
    //exit if there is no search text (i.e. user tapped on the search bar and did not enter text yet)
    if(![searchText length] > 0) {
        
        return;
    }
    //handle when there is search text entered by the user
    else {
        
        //based on the user's search, we will update the contents of the tableSections and tableSectionsAndItems properties
        [self.tableSections removeAllObjects];
        
        [self.tableSectionsAndItems removeAllObjects];
        
        
        NSString *firstSearchCharacter = [searchText substringToIndex:1];
        
        //handle when user taps into search bear and there is no text entered yet
        if([searchText length] == 0) {
            
            self.tableSections = [[ADPTag fetchDistinctItemGroupsInManagedObjectContext:self.fetchedResultsController.managedObjectContext] mutableCopy];
            
            self.tableSectionsAndItems = [[ADPTag fetchItemNamesByGroupInManagedObjectContext:self.fetchedResultsController.managedObjectContext] mutableCopy];
        }
        //handle when user types in one or more characters in the search bar
        else if(searchText.length > 0) {
            
            //the table section will always be based off of the first letter of the group
            NSString *upperCaseFirstSearchCharacter = [firstSearchCharacter uppercaseString];
            
            self.tableSections = [[[NSArray alloc] initWithObjects:upperCaseFirstSearchCharacter, nil] mutableCopy];
            
            
            //there will only be one section (based on the first letter of the search text) - but the property requires an array for cases when there are multiple sections
            self.tableSectionsAndItems = [[ADPTag fetchItemNamesBeginningWith:searchText inManagedObjectContext:self.fetchedResultsController.managedObjectContext] mutableCopy];
        }
        
        //now that the tableSections and tableSectionsAndItems properties are updated, reload the UISearchController's tableview
        [self.fetchedResultsController setValue:self.tableSectionsAndItems forKey:@"sections"];
        [self.fetchedResultsController setValue:self.tableSectionsAndItems forKey:@"fetchedObjects"];
        [((UITableViewController *)self.searchController.searchResultsController).tableView reloadData];
    }
}

#pragma mark - UISearchBarDelegate methods

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    
    [self.tableSections removeAllObjects];
    
    [self.tableSectionsAndItems removeAllObjects];
    
    self.tableSections = [[ADPTag fetchDistinctItemGroupsInManagedObjectContext:self.fetchedResultsController.managedObjectContext] mutableCopy];
    
    self.tableSectionsAndItems = [[ADPTag fetchItemNamesByGroupInManagedObjectContext:self.fetchedResultsController.managedObjectContext] mutableCopy];
}
@end
