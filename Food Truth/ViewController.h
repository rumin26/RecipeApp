//
//  ViewController.h
//  Food Truth
//
//  Created by admin on 1/9/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "PageContentViewController.h"
#import <Social/Social.h>
#import "JLActionSheet.h"
//#import <Pinterest/Pinterest.h>
#import "MBProgressHUD.h"
#import "MODropAlertView.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>



@interface ViewController : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate,MFMailComposeViewControllerDelegate,UITableViewDataSource, UITableViewDelegate,MBProgressHUDDelegate, MODropAlertViewDelegate>

{
    NSMutableArray *arr_fall_recipeImages;
    NSMutableArray *arr_winter_recipeImages;
    NSMutableArray *arr_summer_recipeImages;
    NSMutableArray *arr_spring_recipeImages;
    
    NSMutableArray *arr_winter_recipeThumbnails;
    NSMutableArray *arr_fall_recipeThumbnails;
    NSMutableArray *arr_summer_recipeThumbnails;
    NSMutableArray *arr_spring_recipeThumbnails;

    NSString *selected_season;
    
    UIView* coverView;
    UIView* view;
    
    UILabel* lbl;
    
    UITableView *coverTableView;
    
    UIButton *springbtn;
    UIButton *summerbtn;
    UIButton *closebtn;
    UIButton *restorebtn;
    UIButton *coverhomebtn;
    UIButton *coverspringbtn;
    UIButton *coversummerbtn;
    UIButton *coverwinterbtn;
    UIButton *coverfallbtn;
    
    MFMailComposeViewController *mailComposer;
    
    //Pinterest *pinterest;
    
    MBProgressHUD *progresshud;

    
    
}
@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic)IBOutlet UICollectionView *collectionview;
@property (nonatomic, strong)IBOutlet UICollectionViewFlowLayout *flowLayout;

@property (strong,nonatomic)IBOutlet UIButton *upgradebtn;
@property (strong,nonatomic)IBOutlet UIButton *sharebtn;
@property (strong,nonatomic)IBOutlet UIButton *seasonsbtn;

@property (strong, nonatomic)IBOutlet UIImageView *navbarImageview;


-(IBAction)upgradePressed:(id)sender;
-(IBAction)sharePressed:(id)sender;
-(IBAction)seasonsPressed:(id)sender;



@end

