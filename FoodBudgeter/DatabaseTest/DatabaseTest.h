//
//  DatabaseTest.h
//  DatabaseTest
//
//  Created by Student on 5/2/13.
//  Copyright (c) 2013 Tim Wong, Akia Vongdara. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "AppDelegate.h"
#import "DBManager.h"

@interface DatabaseTest : SenTestCase
@property(nonatomic, strong) DBManager *dbManager;

@end
