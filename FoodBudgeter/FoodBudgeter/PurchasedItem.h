//
//  PurchasedItem.h
//  FoodBudgeter
//
//  Created by Student on 5/4/13.
//  Copyright (c) 2013 Tim Wong, Akia Vongdara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface PurchasedItem : Item <ItemProtocol>

@property(nonatomic, assign) double itemCost;       // Cost of the item, $2.30

- (id)initWithID:(int)_itemId withName:(NSString*)_itemName withDate:(NSDate*)date withCost:(double)cost;

@end
