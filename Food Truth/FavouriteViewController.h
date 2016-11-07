//
//  FavouriteViewController.h
//  Food Truth
//
//  Created by admin on 3/4/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sqlite.h"
#import "MODropAlertView.h"

@interface FavouriteViewController : UIViewController<UIGestureRecognizerDelegate, MODropAlertViewDelegate>

{
    Sqlite *database;
    NSString *recipeNamestr;
    NSString *recipeIngredientsstr;
    NSString *recipeMethodstr;
    
    NSMutableArray *recipeNamearr;
    NSMutableArray *recipeIngredientsArr;
    NSMutableArray *recipeMethodarr;
    NSMutableArray *foodarr;
    
    UIButton* _deleteButton;
    CGPoint p;
    
    
}
@property(strong, nonatomic)NSMutableArray *favoriteRecipes_arr;
@property (strong, nonatomic)IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UILabel *favoriteRecipelbl;


@end
