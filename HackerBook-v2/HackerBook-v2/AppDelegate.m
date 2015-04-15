//
//  AppDelegate.m
//  HackerBook-v2
//
//  Created by Agustín on 13/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "AppDelegate.h"
#import "AGTCoreDataStack.h"
#import "ADPBook.h"
#import "ADPLibraryViewController.h"
#import "UIViewController+Navigation.h"
#import "ADPBooksViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    //Creamos una instancia del stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    //Descargamos los datos y Creamos el modelo
#warning Poner primera vez
    [self didRecieveData];
    
    
    //Un fetchRequest
    NSFetchRequest *fetchReq = [NSFetchRequest fetchRequestWithEntityName:[ADPBook entityName]];
    fetchReq.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:ADPBookAttributes.title ascending:YES selector:@selector(caseInsensitiveCompare:)]];
    fetchReq.fetchBatchSize = 20;
    
    //FetchRequestController
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchReq managedObjectContext:self.stack.context sectionNameKeyPath:nil cacheName:nil];
    
    //Creamos los controladores
    ADPLibraryViewController *libraryVC = [[ADPLibraryViewController alloc] initWithFetchedResultsController:fc style:UITableViewStylePlain];
    ADPBooksViewController *booksVC = [[ADPBooksViewController alloc] init];
    
    
    //Creo el Combinador
    UISplitViewController *split = [[UISplitViewController alloc] init];
    
    [split setViewControllers:@[[libraryVC wrappedInNavigation],[booksVC wrappedInNavigation]]];
    
    //Asignamos delegados
#warning Crear
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = split;
    
    [self.window makeKeyAndVisible];
    
    //Debemos de guardar los datos
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void) didRecieveData{
    
    NSURL *urlJson = [NSURL URLWithString:@"https://t.co/K9ziV0z3SJ"];
    
    NSData *data = [NSData dataWithContentsOfURL:urlJson];
    
    [self saveDataIntoSandbox: (NSData *) data];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:nil];
    [self saveImagesIntoDcouments: (NSDictionary *) json];
    
    [self cargarDatosEnModelo: (NSDictionary *) json];
}

-(void) saveDataIntoSandbox: (NSData *) data{
    
    NSString  *folderHackerBook = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/HackerBook/Data/"];
    NSError *err;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:folderHackerBook withIntermediateDirectories:YES attributes:nil error:&err];
    
    NSMutableString *namFile = [[NSMutableString alloc] init];
    [namFile appendString:@"Documents/HackerBook/Data/"];
    [namFile appendString:@"JSON.txt"];
    
    NSString *jsonFile = [NSHomeDirectory() stringByAppendingPathComponent:namFile];
    
    
    
    [data writeToFile:jsonFile atomically:YES];
    
}

-(void) saveImagesIntoDcouments: (NSDictionary *) json{
    
    NSString  *folderHackerBook = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/HackerBook/Pictures/"];
    NSError *err;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:folderHackerBook withIntermediateDirectories:YES attributes:nil error:&err];
    
    
    
    NSDictionary *dictobj = json;
    for (id key in dictobj)
    {
        NSDictionary *value = key;
        //      [book11 setTitulo:[value objectForKey:@"pdf_url"]];
        
        
        NSData *bookImage = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[[value objectForKey:@"image_url"] description]]];
        
        //Guardamos la imagen con el nombre del libro + jpg
        NSMutableString *nombreLibro = [[NSMutableString alloc] init];
        [nombreLibro appendString:@"Documents/HackerBook/Pictures/"];
        [nombreLibro appendString:[value objectForKey:@"title"]];
        [nombreLibro appendString:@".jpg"];
        
        //Averiguar la URL a la carpeta Documents
        NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:nombreLibro];
        
        
        
        [bookImage writeToFile:jpgPath atomically:YES];
        
    }
    
}

-(void) cargarDatosEnModelo: (NSDictionary *) json{
    
    
    
    NSDictionary *dictobj = json;
    for (id key in dictobj)
    {
        NSDictionary *value = key;
        
        ADPBook *book = [ADPBook initWithTitulo:[value objectForKey:@"title"] isFavorite:NO author:[value objectForKey:@"authors"] context:self.stack.context];
        
    }
    
    // Guardar
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"¡Error al guardar! %@", error);
    }];
}

@end
