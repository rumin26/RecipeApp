//
//  RecipeViewController.h
//  Food Truth
//
//  Created by admin on 1/12/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sqlite.h"
#import "MODropAlertView.h"

@interface RecipeViewController : UIViewController

{
    Sqlite *database;
}

@property (strong, nonatomic)IBOutlet UILabel *recipe_namelbl;
@property (strong, nonatomic)IBOutlet UILabel *recipe_ingredientslbl;
@property (strong, nonatomic)IBOutlet UILabel *recipe_methodlbl;


@property (strong, nonatomic)IBOutlet UIScrollView *scrollview;

@property (strong, nonatomic)IBOutlet UIImageView *recipeBackground;

@property (strong, nonatomic) IBOutlet UIButton *favoritebtn;


@property (strong, nonatomic)NSString *recipe_namestr;
@property (strong, nonatomic)NSString *recipe_ingredientsstr;
@property (strong ,nonatomic)NSString *recipe_methodstr;


-(IBAction)donePressed:(id)sender;

@end
