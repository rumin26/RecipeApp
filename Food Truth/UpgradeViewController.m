//
//  UpgradeViewController.m
//  Food Truth
//
//  Created by admin on 1/28/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import "UpgradeViewController.h"

@interface UpgradeViewController ()

@end

@implementation UpgradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screenrect = [[UIScreen mainScreen]bounds];
    if(screenrect.size.width == 375)
    {
        [self.lbl setText:@"100 Real Foods\n300 Recipes\n"];
        self.pricelbl.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.unlocklbl.font = [UIFont fontWithName:@"Nexa Bold" size:26.0f];
        [self.unlockbtn setImage:[UIImage imageNamed:@"upgradebtn.png"] forState:UIControlStateNormal];
        [self.restorebtn setTitle:@"Restore" forState:UIControlStateNormal];
        
        self.lbl.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.lbl1.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.lbl2.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.restorebtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.cancelbtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];

    }
    else if (screenrect.size.width == 414)
    {
        [self.lbl setText:@"100 Real Foods\n300 Recipes\n"];
        self.pricelbl.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.unlocklbl.font = [UIFont fontWithName:@"Nexa Bold" size:26.0f];
        [self.unlockbtn setImage:[UIImage imageNamed:@"upgradebtn.png"] forState:UIControlStateNormal];
        [self.restorebtn setTitle:@"Restore" forState:UIControlStateNormal];
        
        self.lbl.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.lbl1.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.lbl2.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.restorebtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.cancelbtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];

    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [self.lbl setText:@"100 Real Foods\n300 Recipes\n"];
        float X_Co = (self.view.frame.size.width - screenrect.size.width)/2;
        self.pricelbl.frame = CGRectMake(X_Co, 245, screenrect.size.width, 38);
        self.unlocklbl.frame = CGRectMake(X_Co, 200, screenrect.size.width, 48);
        
        self.pricelbl.font = [UIFont fontWithName:@"Nexa Bold" size:35.0f];
        self.unlocklbl.font = [UIFont fontWithName:@"Nexa Bold" size:50.0f];
        
        float X_Co1 = (self.view.frame.size.width - 250)/2;
        self.unlockbtn.frame = CGRectMake(X_Co1, 290, 250, 250);
        
        
        [self.unlockbtn setImage:[UIImage imageNamed:@"upgradebtn.png"] forState:UIControlStateNormal];
        
        
        [self.restorebtn setTitle:@"Restore" forState:UIControlStateNormal];
        
        float X_Co2 = (self.view.frame.size.width - screenrect.size.width)/2;
        self.lbl.frame = CGRectMake(X_Co2, 540, screenrect.size.width, 90);
        
        float X_Co3 = (self.view.frame.size.width - screenrect.size.width)/2;
        self.lbl1.frame = CGRectMake(X_Co3, 620, screenrect.size.width, 30);
        
        float X_Co4 = (self.view.frame.size.width - screenrect.size.width)/2;
        self.lbl2.frame = CGRectMake(X_Co4, 700, screenrect.size.width, 30);
        
        float X_Co5 = (self.view.frame.size.width - 200)/2;
        self.restorebtn.frame = CGRectMake(X_Co5, 750, 200, 42);
        
        
        self.lbl.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.lbl1.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.lbl2.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.restorebtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:35.0f];
        self.cancelbtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:19.0f];

    }
    else
    {
        
        self.pricelbl.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.unlocklbl.font = [UIFont fontWithName:@"Nexa Bold" size:26.0f];
        [self.unlockbtn setImage:[UIImage imageNamed:@"upgradebtn.png"] forState:UIControlStateNormal];
        [self.restorebtn setTitle:@"Restore" forState:UIControlStateNormal];
        
        self.lbl.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.lbl1.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        self.lbl2.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];
        
        self.restorebtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:22.0f];
        self.cancelbtn.titleLabel.font = [UIFont fontWithName:@"Nexa Bold" size:17.0f];

    }
    
   
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    bool success = false;
    const char *host_name = [@"stackoverflow.com"
                             cStringUsingEncoding:NSASCIIStringEncoding];
    
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(NULL, host_name);
    SCNetworkReachabilityFlags flags;
    success = SCNetworkReachabilityGetFlags(reachability, &flags);
    bool isAvailable = success && (flags & kSCNetworkFlagsReachable) &&
    !(flags & kSCNetworkFlagsConnectionRequired);
    
    [[NSUserDefaults standardUserDefaults]setBool:isAvailable forKey:@"ISNETAVAILABLE"];
    
    if(isAvailable == false)
    {
        MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Not Available" description:@"No products to purchase. Check your internet connection and try again later" okButtonTitle:@"OK"];
        alertView.delegate = self;
        [alertView show];
    }
    else
    {
        
        [self fetchAvailableProducts];
    }

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- Purhcase

-(void)fetchAvailableProducts{
    NSSet *productIdentifiers = [NSSet setWithObjects:@"",nil];
    
    productsRequest = [[SKProductsRequest alloc]
                       initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];

    [self addProgressIndicator];
    
    
    
}

- (BOOL)canMakePurchases
{
    return [SKPaymentQueue canMakePayments];
}

- (void)purchaseMyProduct:(SKProduct*)product{
    if ([self canMakePurchases]) {
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
    else{
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
//                                  @"" message:nil delegate:
//                                  self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//        [alertView show];
        
        MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Sorry"
                                                                        description:@"Purchases are disabled in your device"
                                                                      okButtonTitle:@"OK"];
        alertView.delegate = self;
        
        
        [alertView show];
    }
}

#pragma mark StoreKit Delegate

-(void)paymentQueue:(SKPaymentQueue *)queue
updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"Purchasing");
                break;
            case SKPaymentTransactionStatePurchased:
                if ([transaction.payment.productIdentifier
                     isEqualToString:@""]) {
                    NSLog(@"Purchased ");
//                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
//                                              @"You have successfully expanded spring pack." message:nil delegate:
//                                              self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//                    [alertView show];
                    
                    [[NSUserDefaults standardUserDefaults]setValue:@"recipePurhcased" forKey:@"inApp"];
                    [self removeProgressIndicator];

                    
                }
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                NSLog(@"Restored ");
                
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                
                
                if([transaction.payment.productIdentifier isEqualToString:@""])
                    [[NSUserDefaults standardUserDefaults]setValue:@"recipePurhcased" forKey:@"inApp"];
                    
                if([transaction.payment.productIdentifier isEqualToString:@""])
                    [[NSUserDefaults standardUserDefaults]setValue:@"recipePurhcased" forKey:@"inApp"];
                        
                if([transaction.payment.productIdentifier isEqualToString:@""])
                    [[NSUserDefaults standardUserDefaults]setValue:@"recipePurhcased" forKey:@"inApp"];
                            
                if([transaction.payment.productIdentifier isEqualToString:@""])
                [[NSUserDefaults standardUserDefaults]setValue:@"recipePurhcased" forKey:@"inApp"];
                
                
                [self removeProgressIndicator];
                
                break;
            case SKPaymentTransactionStateFailed:
                NSLog(@"Purchase failed ");
                //[self removeProgressIndicator];
                [progresshud removeFromSuperview];
                [MBProgressHUD hideHUDForView:self.view animated:YES];

                break;
            default:
                break;
        }
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error
{
    [progresshud removeFromSuperview];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

-(void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue {
    NSLog(@"%@",queue );
    NSLog(@"Restored Transactions are once again in Queue for purchasing %@",[queue transactions]);
    
    NSMutableArray *purchasedItemIDs = [[NSMutableArray alloc] init];
    NSLog(@"received restored transactions: %i", queue.transactions.count);
    
    for (SKPaymentTransaction *transaction in queue.transactions) {
        
        NSString *productID = transaction.payment.productIdentifier;
        [purchasedItemIDs addObject:productID];
        NSLog (@"product id is %@" , productID);
        // here put an if/then statement to write files based on previously purchased items
        // example if ([productID isEqualToString: @"youruniqueproductidentifier]){write files} else { nslog sorry}
        
    }
    [[NSUserDefaults standardUserDefaults]setValue:@"recipePurhcased" forKey:@"inApp"];
    
    [self removeProgressIndicator];
}

-(void)productsRequest:(SKProductsRequest *)request
    didReceiveResponse:(SKProductsResponse *)response
{
    SKProduct *validProduct = nil;
    int count = [response.products count];
    if (count>0) {
        validProducts = response.products;
        //NSLog(@"validProducts:%@",response.products);
        
        validProduct = [response.products objectAtIndex:0];
        
        NSLog(@"1:%@", validProduct.productIdentifier);
        
        if ([validProduct.productIdentifier
             isEqualToString:@""]) {
            
            [self removeProgressIndicator];
            
            
//            NSDecimalNumber *amount = validProduct.price;
//            NSNumberFormatter *currencyFormat = [[NSNumberFormatter alloc] init];
//            NSLocale *locale = [NSLocale currentLocale];
//            [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
//            [currencyFormat setLocale:locale];
//            NSString *price = [currencyFormat stringFromNumber:amount];
//            springbtn.titleLabel.textAlignment = NSTextAlignmentLeft;
//            
//            [springbtn setTitle:[NSString stringWithFormat:@"%@                    %@",validProduct.localizedTitle,price] forState:UIControlStateNormal];
            
        }
        
        validProduct = [response.products objectAtIndex:1];
        NSLog(@"2:%@", validProduct.productIdentifier);
        if ([validProduct.productIdentifier
             isEqualToString:@""]) {
            
            [self removeProgressIndicator];
//
//            
////            NSDecimalNumber *amount = validProduct.price;
////            NSNumberFormatter *currencyFormat = [[NSNumberFormatter alloc] init];
////            NSLocale *locale = [NSLocale currentLocale];
////            [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
////            [currencyFormat setLocale:locale];
////            NSString *price = [currencyFormat stringFromNumber:amount];
////            summerbtn.titleLabel.textAlignment = NSTextAlignmentLeft;
////            
////            [summerbtn setTitle:[NSString stringWithFormat:@"%@                 %@",validProduct.localizedTitle,price] forState:UIControlStateNormal];
       }
       
        validProduct = [response.products objectAtIndex:2];
        NSLog(@"3:%@", validProduct.productIdentifier);
        if ([validProduct.productIdentifier
             isEqualToString:@""]) {
            [self removeProgressIndicator];
            //
            //
            ////            NSDecimalNumber *amount = validProduct.price;
            ////            NSNumberFormatter *currencyFormat = [[NSNumberFormatter alloc] init];
            ////            NSLocale *locale = [NSLocale currentLocale];
            ////            [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
            ////            [currencyFormat setLocale:locale];
            ////            NSString *price = [currencyFormat stringFromNumber:amount];
            ////            summerbtn.titleLabel.textAlignment = NSTextAlignmentLeft;
            ////
            ////            [summerbtn setTitle:[NSString stringWithFormat:@"%@                 %@",validProduct.localizedTitle,price] forState:UIControlStateNormal];
        }
        validProduct = [response.products objectAtIndex:3];
        NSLog(@"4:%@", validProduct.productIdentifier);
        if ([validProduct.productIdentifier
             isEqualToString:@""]) {
            [self removeProgressIndicator];
            //
            //
            ////            NSDecimalNumber *amount = validProduct.price;
            ////            NSNumberFormatter *currencyFormat = [[NSNumberFormatter alloc] init];
            ////            NSLocale *locale = [NSLocale currentLocale];
            ////            [currencyFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
            ////            [currencyFormat setLocale:locale];
            ////            NSString *price = [currencyFormat stringFromNumber:amount];
            ////            summerbtn.titleLabel.textAlignment = NSTextAlignmentLeft;
            ////
            ////            [summerbtn setTitle:[NSString stringWithFormat:@"%@                 %@",validProduct.localizedTitle,price] forState:UIControlStateNormal];
        }

        
    } else {
        [self removeProgressIndicator];
        
        
        MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Not Available" description:@"No products to purchase. Check your internet connection or try again later" okButtonTitle:@"OK"];
        alertView.delegate = self;
        [alertView show];

    }
}

#pragma mark- UIButton Actions

-(IBAction)purchaseProduct:(id)sender
{
//    [self purchaseMyProduct:[validProducts objectAtIndex:3]];
//    progresshud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    progresshud.labelText = @"Purchasing Product...";
    MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Not Available" description:@"No products to purchase. Check your internet connection or try again later" okButtonTitle:@"OK"];
    alertView.delegate = self;
    [alertView show];


}
-(IBAction)restorePurchase:(id)sender
{
//    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
//    [[SKPaymentQueue defaultQueue]restoreCompletedTransactions];
//    progresshud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    progresshud.labelText = @"Restoring Purchase...";
    MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Not Available" description:@"No products to purchase. Check your internet connection or try again later" okButtonTitle:@"OK"];
    alertView.delegate = self;
    [alertView show];


}
-(IBAction)cancelPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Indicator

-(void)addProgressIndicator
{
   progresshud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   progresshud.labelText = @"Fetching Product...";
    
}
-(void)removeProgressIndicator
{
    [progresshud removeFromSuperview];
    [MBProgressHUD hideHUDForView:self.view animated:YES];

    progresshud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progresshud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    progresshud.mode = MBProgressHUDModeCustomView;
    progresshud.delegate = self;
    progresshud.labelText = @"Completed";
    [progresshud show:YES];
    [progresshud hide:YES afterDelay:2];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
