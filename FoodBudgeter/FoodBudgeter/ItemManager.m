//
//  ItemManager.m
//  FoodBudgeter
//
//  Created by Student on 5/7/13.
//  Copyright (c) 2013 Tim Wong, Akia Vongdara. All rights reserved.
//

#import "ItemManager.h"

@implementation ItemManager

@synthesize dbManager, items, ingredients;

- (id)init {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (BOOL)buildItems {
    [self setItems:[dbManager buildItems]];
    return true;
}

- (BOOL)addPurchaseItem:(NSString *)itemName withCost:(double)itemCost {
    if (itemCost <= 0.00 || [self getItemByName:itemName] != nil)
        return false;
    Item *item = [[PurchasedItem alloc] initWithID:0 withName:itemName withDate:[NSDate date] withCost:itemCost];
    [items addObject:item];
    return [dbManager addItem:item];
}

- (BOOL)addRecipeItem:(NSString *)itemName withIngredients:(NSMutableArray *)ingredients {
    if ([self getItemByName:itemName] != nil) {
        return false;
    }
    Item *item = [[RecipeItem alloc] initWithID:0 withName:itemName withDate:[NSDate date] withIngredients:ingredients];
    [items addObject:item];
    return [dbManager addItem:item];
}

- (BOOL)addGroceryItem:(NSString *)itemName withCost:(double)itemCost withUnitAmount:(double)unitAmount withUnitType:(NSString *)unitType {
    if (itemCost <= 0.00 || [self getItemByName:itemName] != nil)
        return false;
    Item *item = [[GroceryItem alloc] initWithID:0 withName:itemName withDate:[NSDate date] withCost:itemCost unitAmount:unitAmount unitType:unitType];
    [items addObject:item];
    return [dbManager addItem:item];
}

- (Item*)getItemByName:(NSString*)itemName {
    for (Item *item in items) {
        if ([[item itemName] isEqualToString:itemName]) {
            return item;
        }
    }
    return nil;
}

- (BOOL)removeItem:(Item *)item {
    if ([self.items indexOfObject:item] != -1) {
        [items removeObject:item];
        return [dbManager removeItem:item];
    }
    return false;
}

- (BOOL)removeItemByName:(NSString *)name {
    Item *item;
    for (item in items) {
        if ([[item itemName] isEqualToString:name]) {
            break;
        }
    }
    if (item != nil)
        return [self removeItem:item];
    return false;
}

- (int)numOfItems {
    return [items count];
}

- (NSMutableArray*)retrieveGroceryItems {
    NSMutableArray *groceryItems = [[NSMutableArray alloc]init];
    for (Item *item in items) {
        if ([[item itemType] isEqualToString:@"Grocery"]) {
            [groceryItems addObject:item];
        }
    }
    return groceryItems;
}

- (double)totalAmountSpent {
    double cost = 0;
    for (Item *item in items) {
        cost += [item itemCost];
    }
    return cost;
}

@end
