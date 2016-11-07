//
//  UpgradeViewController.h
//  Food Truth
//
//  Created by admin on 1/28/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "MBProgressHUD.h"
#import "MODropAlertView.h"
#import "Reachability.h"

@interface UpgradeViewController : UIViewController<SKProductsRequestDelegate,SKPaymentTransactionObserver, MBProgressHUDDelegate, MODropAlertViewDelegate>
{
    SKProductsRequest *productsRequest;
    NSArray *validProducts;
    
    MBProgressHUD *progresshud;

}
@property(strong, nonatomic)IBOutlet UILabel *pricelbl;
@property(strong, nonatomic)IBOutlet UILabel *unlocklbl;
@property(strong, nonatomic)IBOutlet UILabel *lbl;
@property(strong, nonatomic)IBOutlet UILabel *lbl1;
@property(strong, nonatomic)IBOutlet UILabel *lbl2;


@property(strong, nonatomic)IBOutlet UIButton *unlockbtn;
@property(strong, nonatomic)IBOutlet UIButton *restorebtn;
@property(strong, nonatomic)IBOutlet UIButton *cancelbtn;


-(IBAction)purchaseProduct:(id)sender;
-(IBAction)restorePurchase:(id)sender;
-(IBAction)cancelPressed:(id)sender;

@end
