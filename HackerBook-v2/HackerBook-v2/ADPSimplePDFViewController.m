//
//  ADPSimplePDFViewController.m
//  HackerBook-v2
//
//  Created by Agustín on 20/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "ADPSimplePDFViewController.h"
#import "ADPBook.h"
#import "ADPPdf.h"

@interface ADPSimplePDFViewController ()

@end

@implementation ADPSimplePDFViewController

-(id)initWithModel:(ADPBook *) book{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = book;
        self.title = book.title;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
    [self syncWithModel];
    
    /*
    // Alta en notificaciones de library
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatBookDidChange:)
               name:AGTBOOK_DID_CHANGE_NOTIFICATION
             object:nil];
     */
}

#pragma mark - Notificaciones
-(void) notifyThatBookDidChange:(NSNotification *) notification{
    
    /*
    // sacamos el nuevo libro
    ADPBook *newBook = [notification.userInfo objectForKey:BOOK_KEY];
    self.model = newBook;
    [self syncWithModel];
     */
}

#pragma mark - Util
-(void) syncWithModel{
    
    self.title = self.model.title;
    
    NSURL *url = [NSURL URLWithString:self.model.pdf.pdfUrl ];
    
    [self.pdfView loadRequest:[NSURLRequest requestWithURL:url]];
    
    //[self.activityView stopAnimating];
    //self.activityView.hidden = YES;

    
    /*
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSURL *localURL = [self localURLForRemoteURL:self.model.pdfURL];
    if ([fm fileExistsAtPath:[localURL path]]) {
        [self.pdfView loadData:[NSData dataWithContentsOfURL:localURL]
                      MIMEType:@"application/pdf"
              textEncodingName:@"UTF-8"
                       baseURL:nil];
        
    }else{
        // No está en local
        // Hay que descargar y guardar
        self.activityView.hidden = NO;
        [self.activityView startAnimating];
        
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:self.model.pdfURL];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.pdfView loadData:data
                              MIMEType:@"application/pdf"
                      textEncodingName:@"UTF-8"
                               baseURL:nil];
                
                [self.activityView stopAnimating];
                self.activityView.hidden = YES;
                
                [data writeToURL:localURL
                      atomically:YES];
            });
        });
    }
     */
    
}


-(NSURL*)documentsDirectory{
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSURL *docs = [[fm URLsForDirectory:NSDocumentDirectory
                              inDomains:NSUserDomainMask] lastObject];
    return docs;
}

-(NSURL *) localURLForRemoteURL:(NSURL*) remoteURL{
    
    NSString *fileName = [remoteURL lastPathComponent];
    NSURL *local = [[self documentsDirectory] URLByAppendingPathComponent:fileName];
    
    return local;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
