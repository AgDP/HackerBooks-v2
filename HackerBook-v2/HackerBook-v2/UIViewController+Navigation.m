//
//  UIViewController+Navigation.m
//  HackerBook-v2
//
//  Created by Agustín on 15/04/2015.
//  Copyright (c) 2015 Agustin. All rights reserved.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

-(UINavigationController *) wrappedInNavigation{
    
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self
                   animated:NO];
    return nav;
}

@end
