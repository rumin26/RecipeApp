//
//  PageContentViewController.h
//  Food Truth
//
//  Created by admin on 1/9/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sqlite.h"
#import "ViewController.h"
#import "UpgradeViewController.h"

@interface PageContentViewController : UIViewController
{
    Sqlite *database;
    
    NSMutableArray *recipeNameArr;
    NSMutableArray *recipeIngredientsArr;
    NSMutableArray *recipeMethodArr;
    
    NSString *recipeNamestr;
    NSString *recipeIngredientsstr;
    NSString *recipeMethodstr;
    NSString *recipestr;
    NSString *recipeTypestr;
    
    

}

@property (strong, nonatomic)IBOutlet UIImageView *recipeImageView;
@property (strong, nonatomic)IBOutlet UIView *inappImageView;
@property (strong, nonatomic)IBOutlet UIImageView *footerImageview;
@property (strong, nonatomic)IBOutlet UIImageView *keylineImageView1;
@property (strong, nonatomic)IBOutlet UIImageView *keylineImageView2;

@property(strong, nonatomic)IBOutlet UILabel *lbl1;
@property(strong, nonatomic)IBOutlet UILabel *lbl2;


@property (strong, nonatomic)IBOutlet UIView *Footerview;

@property (strong, nonatomic)IBOutlet UIButton *cinchbtn;
@property (strong, nonatomic)IBOutlet UIButton *simplebtn;
@property (strong, nonatomic)IBOutlet UIButton *sensationalbtn;

@property (strong, nonatomic)IBOutlet UIButton *btn;


@property NSUInteger pageIndex;
@property NSString *imageFile;

-(IBAction)cinchbtnPressed:(id)sender;
-(IBAction)simplebtnPressed:(id)sender;
-(IBAction)sensationalbtnPressed:(id)sender;
//-(IBAction)slideViews:(id)sender;



@end
