//
//  ViewController.m
//  Food Truth
//
//  Created by admin on 1/9/15.
//  Copyright (c) 2015 TaxSmart Technologies Pvt. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "HomeViewController.h"

@interface ViewController () <JLActionSheetDelegate>
@property (nonatomic, strong) JLActionSheet* actionSheet;

@end

@implementation ViewController
@synthesize navbarImageview;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //pinterest = [[Pinterest alloc]initWithClientId:@"1442573"];
    
    [[NSUserDefaults standardUserDefaults]setValue:@"dontopenrecipe" forKey:@"fromview"];

    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.navigationController setNavigationBarHidden:YES];
    
    self.navigationItem.leftBarButtonItem = nil;
    [self.navigationItem setHidesBackButton:YES];
    
    [self.navbarImageview setImage:[UIImage imageNamed:@"navbar.png"]];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(slideViewsUpDown) name:@"slide" object:nil];
    
    
   selected_season = [[NSUserDefaults standardUserDefaults]valueForKey:@"recipe"];
    
    if([selected_season isEqualToString:@"spring"])
    {
        arr_spring_recipeImages = [[NSMutableArray alloc]initWithObjects:@"Asparagus.jpg",@"Broccoli.jpg",@"Crab.jpg",@"Currant.jpg",@"Egg.jpg",@"Escarole.jpg",@"Fennel.jpg",@"Fiddlehead-Ferns.jpg", @"Flounder.jpg",@"Ginger.jpg",@"Grapefruit.jpg",@"Lamb.jpg",@"Leek.jpg",@"Lemon.jpg",@"Mint.jpg",@"Olive.jpg",@"Peas.jpg",@"Quinoa.jpg",@"Radish.jpg",@"Rhubarb.jpg",@"Sea-Vegetables.jpg",@"Spinach.jpg",@"Strawberry.jpg",@"Sunflower-Seeds.jpg",@"Watercress.jpg", nil];
        arr_spring_recipeThumbnails = [[NSMutableArray alloc]initWithObjects:@"Asparagus-t.jpg",@"Broccoli-t.jpg",@"Crab-t.jpg",@"Currant-t.jpg",@"Egg-t.jpg",@"Escarole-t.jpg",@"Fennel-t.jpg",@"Fiddle-Heads-t.jpg",@"Flounder-t.jpg",@"Ginger-t.jpg",@"Grapefruit-t.jpg",@"Lamb-t.jpg",@"Leek-t.jpg",@"Lemon-t.jpg",@"Mint-t.jpg",@"Olives-t.jpg",@"Peas-t.jpg",@"Quinoa-t.jpg",@"Radish-t.jpg",@"Rhubarb-t.jpg",@"Sea-Vegetables-t.jpg",@"Spinach-t.jpg",@"Strawberry-t.jpg",@"Sunflower-Seeds-t.jpg",@"Watercress-t.jpg", nil];
        
    }
    else if ([selected_season isEqualToString:@"winter"])
    {
        arr_winter_recipeImages = [[NSMutableArray alloc]initWithObjects:@"Banana.jpg",@"Beef.jpg",@"Celeriac.jpg",@"Chocolate.jpg",@"Cinnamon.jpg",@"Coconut.jpg",@"Cod.jpg",@"Date.jpg",@"Kale.jpg",@"Kiwi.jpg",@"Lentil.jpg",@"Mango.jpg",@"Mushroom.jpg",@"Onion.jpg",@"Orange.jpg",@"Papaya.jpg",@"Parsnip.jpg",@"Pear.jpg",@"Pineapple.jpg",@"Pomegranate.jpg",@"Prune.jpg",@"Rutabaga.jpg",@"Sardines.jpg",@"Walnut.jpg",@"Yam.jpg", nil];
        
        arr_winter_recipeThumbnails = [[NSMutableArray alloc]initWithObjects:@"Banana-t.jpg",@"Beef-t.jpg",@"Celeriac-t.jpg",@"Chocolate-t.jpg",@"Cinnamon-t.jpg",@"Coconut-t.jpg",@"Cod-t.jpg",@"Date-t.jpg",@"Kale-t.jpg",@"Kiwi-t.jpg",@"Lentil-t.jpg",@"Mango-t.jpg",@"Mushroom-t.jpg",@"Onion-t.jpg",@"Orange-t.jpg",@"Papaya-t.jpg",@"Parsnip-t.jpg",@"Pears-t.jpg",@"Pineapple-t.jpg",@"Pomegranate-t.jpg",@"Prune-t.jpg",@"Rutabaga-t.jpg",@"Sardines-t.jpg",@"walnut-t.jpg",@"Yam-t.jpg", nil];
    }
    else if ([selected_season isEqualToString:@"summer"])
    {
        arr_summer_recipeImages = [[NSMutableArray alloc]initWithObjects:@"Almond.jpg",@"Apricots.jpg",@"Arugula.jpg",@"Avocado.jpg",@"Bell-Pepper.jpg",@"Blueberry.jpg",@"Bok-Choy.jpg",@"Chicken.jpg",@"Cilantro.jpg",@"Corn.jpg",@"Cucumber.jpg",@"Eggplant.jpg",@"Endive.jpg",@"Frisee.jpg",@"Green-Bean.jpg",@"Melons.jpg",@"Peach.jpg",@"Radicchio.jpg",@"Salmon.jpg",@"Sesame-Seeds.jpg",@"Shrimp.jpg",@"Tomatillo.jpg",@"Tomato.jpg",@"Water.jpg",@"Zucchini.jpg", nil];
        
        arr_summer_recipeThumbnails = [[NSMutableArray alloc]initWithObjects:@"Almond-t.jpg",@"Apricot-t.jpg",@"Arugula-t.jpg",@"Avocado-t.jpg",@"BellPepper-t.jpg",@"Blueberry-t.jpg",@"BokChoy-t.jpg",@"Chicken-t.jpg",@"Cilantro-t.jpg",@"Corn-t.jpg",@"Cucumber-t.jpg",@"Eggplant-t.jpg",@"Endive-t.jpg",@"Frisee-t.jpg",@"GreenBean-t.jpg",@"Melon-t.jpg",@"Peach-t.jpg",@"Radicchio-t.jpg",@"Salmon-t.jpg",@"SesameSeeds-t.jpg",@"Shrimp-t.jpg",@"Tomatillo-t.jpg",@"Tomato-t.jpg",@"Water-t.jpg",@"Zucchini-t.jpg", nil];
    }
    else if ([selected_season isEqualToString:@"fall"])
    {
        arr_fall_recipeImages = [[NSMutableArray alloc]initWithObjects:@"Apple.jpg",@"Beet.jpg",@"Brussels.jpg",@"Cabbage.jpg",@"Carrot.jpg",@"Cauliflower.jpg",@"Celery.jpg",@"Chard.jpg",@"Chile.jpg",@"Collard.jpg",@"Cranberry.jpg",@"Fig.jpg",@"Garlic.jpg",@"Grape.jpg",@"Oregano.jpg",@"Parsley.jpg",@"Pistachio.jpg",@"Pork.jpg",@"Pumpkin.jpg",@"Pumpkin Seeds.jpg",@"Raspberry.jpg",@"Shallot.jpg",@"Squash.jpg",@"Turkey.jpg",@"Venison.jpg", nil];
        arr_fall_recipeThumbnails = [[NSMutableArray alloc]initWithObjects:@"Apple-t.jpg",@"Beet-t.jpg",@"Brussels-t.jpg",@"Cabbage-t.jpg",@"Carrot-t.jpg",@"cauliflower-t.jpg",@"Celery-t.jpg",@"Chard-t.jpg",@"Chile-t.jpg",@"Collards-t.jpg",@"Cranberry-t.jpg",@"Fig-t.jpg",@"Garlic-t.jpg",@"Grape-t.jpg",@"Oregano-t.jpg",@"Parsley-t.jpg",@"Pistachio-t.jpg",@"Pork-t.jpg",@"Pump-t.jpg",@"Pumpkin-t.jpg",@"Raspberry-t.jpg",@"Shallot-t.jpg",@"Squash-t.jpg",@"Turkey-t.jpg",@"Venison-t.jpg", nil];
    }
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.alpha = 0;
    
    [UIView animateWithDuration:1.0 animations:^{
        
    self.pageViewController.view.frame = CGRectMake(0, 38, self.view.frame.size.width, self.view.frame.size.height - 106);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
        self.pageViewController.view.alpha = 1;

    [self.pageViewController didMoveToParentViewController:self];
        
    }];
    
    
    [self.collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionview.backgroundColor = [UIColor clearColor];
    
    // Configure layout
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [self.flowLayout setItemSize:CGSizeMake(68, 68)];
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    self.flowLayout.minimumInteritemSpacing = 0.0f;
    self.flowLayout.minimumLineSpacing = 3.0f;
    
    [self.collectionview setCollectionViewLayout:self.flowLayout];
    self.collectionview.bounces = YES;
    
    [self.collectionview setShowsHorizontalScrollIndicator:NO];
    [self.collectionview setShowsVerticalScrollIndicator:NO];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor blackColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    
    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    if([selected_season isEqualToString:@"spring"])
    {
        pageContentViewController.imageFile = arr_spring_recipeImages[index];
        pageContentViewController.pageIndex = index;
        
        
    }
    else if ([selected_season isEqualToString:@"winter"])
    {
        pageContentViewController.imageFile = arr_winter_recipeImages[index];
        pageContentViewController.pageIndex = index;

    }
    else if ([selected_season isEqualToString:@"summer"])
    {
        pageContentViewController.imageFile = arr_summer_recipeImages[index];
        pageContentViewController.pageIndex = index;

    }
    else if ([selected_season isEqualToString:@"fall"])
    {
        pageContentViewController.imageFile = arr_fall_recipeImages[index];
        pageContentViewController.pageIndex = index;
    }
    
    
    return pageContentViewController;
}

#pragma -mark UICollectionView

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSInteger count;
    
    if([selected_season isEqualToString:@"spring"])
    {
        count = arr_spring_recipeImages.count;
        NSLog(@"spring:%d",count);
    }
    else if ([selected_season isEqualToString:@"winter"])
    {
        count = arr_winter_recipeImages.count;
        NSLog(@"winter:%d",count);
    }
    else if ([selected_season isEqualToString:@"summer"])
    {
        count = arr_summer_recipeImages.count;
        NSLog(@"summer:%d",count);
        
    }
    else if ([selected_season isEqualToString:@"fall"])
    {
        count = arr_fall_recipeImages.count;
        NSLog(@"fall:%d",count);
    }
    return count;
    
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *img=[[UIImageView alloc]init];
    //long row = [indexPath row];
    
    if([selected_season isEqualToString:@"spring"])
    {
        img.image = [UIImage imageNamed:[arr_spring_recipeThumbnails objectAtIndex:indexPath.row]];
        
        [cell setBackgroundView:img];
        
        
    }
    else if ([selected_season isEqualToString:@"winter"])
    {
        img.image = [UIImage imageNamed:[arr_winter_recipeThumbnails objectAtIndex:indexPath.row]];
        
        [cell setBackgroundView:img];
        
    }
    else if ([selected_season isEqualToString:@"summer"])
    {
        img.image = [UIImage imageNamed:[arr_summer_recipeThumbnails objectAtIndex:indexPath.row]];
        
        [cell setBackgroundView:img];
    }
    else if ([selected_season isEqualToString:@"fall"])
    {
        img.image = [UIImage imageNamed:[arr_fall_recipeThumbnails objectAtIndex:indexPath.row]];
        
        [cell setBackgroundView:img];
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    PageContentViewController *ViewController = [self viewControllerAtIndex:indexPath.row];
    NSArray *viewControllers = @[ViewController];
    self.pageViewController.view.alpha = 0;
    [UIView animateWithDuration:0.8 animations:^{
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
        self.pageViewController.view.alpha = 1;
        
    }];
    
    NSLog(@"%d",indexPath.row);
    
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
        
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    
    NSInteger count;
    
    if([selected_season isEqualToString:@"spring"])
    {
        count = arr_spring_recipeImages.count;
    }
    else if ([selected_season isEqualToString:@"winter"])
    {
        count = arr_winter_recipeImages.count;
        
    }
    else if ([selected_season isEqualToString:@"summer"])
    {
        count = arr_summer_recipeImages.count;
    }
    else if ([selected_season isEqualToString:@"fall"])
    {
        count = arr_fall_recipeImages.count;
    }

   if (index == count) {
       
       return nil;
       

   }
    return [self viewControllerAtIndex:index];
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    
    NSInteger count;
    
    if([selected_season isEqualToString:@"spring"])
    {
        count = arr_spring_recipeImages.count;
        NSLog(@"spring:%d",count);
    }
    else if ([selected_season isEqualToString:@"winter"])
    {
        count = arr_winter_recipeImages.count;
         NSLog(@"winter:%d",count);
    }
    else if ([selected_season isEqualToString:@"summer"])
    {
        count = arr_summer_recipeImages.count;
         NSLog(@"summer:%d",count);
        
    }
    else if ([selected_season isEqualToString:@"fall"])
    {
        count = arr_fall_recipeImages.count;
         NSLog(@"fall:%d",count);
    }
    
    return count;
    
}

#pragma mark - Page View Controller Delegate

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    
    if(completed){
        
        PageContentViewController *pCV =[self.pageViewController.viewControllers lastObject];
        [[NSUserDefaults standardUserDefaults]setInteger:pCV.pageIndex forKey:@"pagenumber"];
        
         [[NSUserDefaults standardUserDefaults]setValue:arr_spring_recipeImages[pCV.pageIndex] forKey:@"recipeimage"];
    }
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    PageContentViewController *pCV =[self.pageViewController.viewControllers lastObject];
    [[NSUserDefaults standardUserDefaults]setInteger:pCV.pageIndex forKey:@"pagenumber"];
    //NSLog(@"page:%d",pCV.pageIndex);
    
}

#pragma -mark NavigationButtons

-(IBAction)upgradePressed:(id)sender
{
    NSString *inapp = [[NSUserDefaults standardUserDefaults]valueForKey:@"inApp"];

    if ([inapp isEqualToString:@"recipePurhcased"])
    
    {
        
            MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Already Upgraded"
                                                                            description:@"You have already unlocked all recipes."
                                                                          okButtonTitle:@"OK"];
            alertView.delegate = self;
            
            
            [alertView show];


    }
    
    else
    {
            [self performSegueWithIdentifier:@"upgrade" sender:nil];
    
    }
    
//    CGRect screenRect = [[UIScreen mainScreen] bounds];
//    //create a new view with the same size
//    
//    coverView = [[UIView alloc] initWithFrame:screenRect];
//    // change the background color to black and the opacity to 0.6
//    coverView.backgroundColor = [UIColor colorWithRed:19.0/255 green:35.0/255 blue:54.0/255 alpha:1.0];
//    
//    //create a new view with the same size
//    view = [[UIView alloc] initWithFrame:CGRectMake(0, screenRect.origin.y + 80,screenRect.size.width, 200)];
//    // change the background color to black and the opacity to 0.6
//    view.backgroundColor = [UIColor colorWithRed:117.0/255 green:187.0/255 blue:5.0/255 alpha:1.0];
//    
//    
//    // closebtn
//    
//    closebtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [closebtn addTarget:self
//                 action:@selector(upgradeclosebtnPressed)
//       forControlEvents:UIControlEventTouchUpInside];
//    
//    [closebtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
//    
//    closebtn.frame = CGRectMake(0, 0, 30, 30);
//    
//    
//    //spring button
//    springbtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [springbtn addTarget:self
//                action:@selector(upgradeSpring)
//      forControlEvents:UIControlEventTouchUpInside];
//    float X_Co = (coverView.frame.size.width - 320)/2;
//    springbtn.frame = CGRectMake(X_Co,35,320, 60);
//    springbtn.backgroundColor = [UIColor blueColor];
//    
//    //summer button
//    summerbtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [summerbtn addTarget:self
//                  action:@selector(upgradeSummer)
//        forControlEvents:UIControlEventTouchUpInside];
//    
//    float X_Co1 = (coverView.frame.size.width - 320)/2;
//    summerbtn.frame = CGRectMake(X_Co1,105,320, 60);
//    summerbtn.backgroundColor = [UIColor blueColor];
//
//    //activity indicator
//    
//    activityIndicatorView = [[UIActivityIndicatorView alloc]
//                             initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    activityIndicatorView.center = coverView.center;
//    [activityIndicatorView hidesWhenStopped];
//    
//    //lbl
//    
//    lbl = [[UILabel alloc]initWithFrame:CGRectMake(10,screenRect.origin.y+300,screenRect.size.width - 10, 200)];
//    lbl.textColor = [UIColor whiteColor];
//    
//    lbl.text = @"You can get more seasonal recipes by purchasing expansion packs. It is best to use a WiFi or 3G connection to ensure the transaction goes through. You can also restore a previous purchase using the button above.";
//    lbl.textAlignment = NSTextAlignmentCenter;
//    
//    lbl.numberOfLines = 0;
//    
//    //restorebtn
//    
//    restorebtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [restorebtn addTarget:self
//                  action:@selector(restorePurchase)
//        forControlEvents:UIControlEventTouchUpInside];
//    
//    float X_Co2 = (coverView.frame.size.width - 250)/2;
//
//    restorebtn.frame = CGRectMake(X_Co2,280,250, 50);
//    [restorebtn setTitle:@"Restore a Previous Purchase" forState:UIControlStateNormal];
//    restorebtn.titleLabel.font = [UIFont fontWithName:@"Verdana" size:14];
//    [restorebtn setTitleColor:[UIColor colorWithRed:56.0/255 green:84.0/255 blue:135.0/255 alpha:1.0] forState:UIControlStateNormal];
//    
//    [coverView addSubview:view];
//    
//    [coverView addSubview:activityIndicatorView];
//    
//    [activityIndicatorView startAnimating];
//    [coverView addSubview:lbl];
//    [coverView addSubview:restorebtn];
//    
//    
//    [view addSubview:springbtn];
//    [view addSubview:summerbtn];
//    
//    [coverView addSubview:closebtn];
//    // add this new view to your main view
//    [self.view addSubview:coverView];

}
-(IBAction)sharePressed:(id)sender
{
//UIActionSheet *actionsheet = [[UIActionSheet alloc]initWithTitle:@"How do you want to share recipe?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook",@"Twitter",@"E-mail", nil];
//    [actionsheet showInView:self.view];
    
    NSMutableArray* buttonTitles = [self getButtonTitles];
    NSString* cancelTitle        =  @"Cancel";
    NSString* sheetTitle         = @"How do you want to share recipe?";
    
    _actionSheet                 = [JLActionSheet sheetWithTitle:sheetTitle delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:buttonTitles];
    //[_actionSheet allowTapToDismiss:[_allowTapSwitch isOn]];
    [_actionSheet setStyle:JLSTYLE_CLEANBLUE];
    [_actionSheet showOnViewController:self];

}
-(IBAction)seasonsPressed:(id)sender
{
    coverTableView.alpha = 0;
    
    [UIView animateWithDuration:0.6 animations:^{
        
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //create a new view with the same size
    coverView = [[UIView alloc] initWithFrame:screenRect];
    // change the background color to black and the opacity to 0.6
    coverView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.85];
    
    // closebtn
    
    closebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closebtn addTarget:self
               action:@selector(closebtnPressed)
     forControlEvents:UIControlEventTouchUpInside];
    
    [closebtn setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
    
    closebtn.frame = CGRectMake(0, 0, 30, 30);
    
    

            [coverView addSubview:closebtn];
            
            coverTableView = [[UITableView alloc] initWithFrame:CGRectMake(7, 40, screenRect.size.width, screenRect.size.height)];
            coverTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
            coverTableView.delegate = self;
            coverTableView.dataSource = self;
            coverTableView.alpha =1;
            [coverView addSubview:coverTableView];
            [self.view addSubview:coverView];
        
}];
    
//[self performSegueWithIdentifier:@"showseasonmenu" sender:nil];
    
}

#pragma mark - TableView DataSource Implementation

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return 98;
    
    else return 55;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return 30;
    else
        return 22;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    //cell.backgroundView = [[UIView alloc] init];
   // [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
    //[[[cell contentView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView.backgroundColor = [UIColor clearColor];
    if(indexPath.section ==0)
    {
        cell.imageView.image = [UIImage imageNamed:@"homeHome.png"];
        
        cell.textLabel.text = @"Home";

    }
    if(indexPath.section ==1)
    {
        cell.imageView.image = [UIImage imageNamed:@"favoriteHome.png"];
        cell.textLabel.text = @"Favorite Recipes";
        
    }
    if(indexPath.section ==2)
    {
        
    cell.imageView.image = [UIImage imageNamed:@"springHome.png"];
        
    cell.textLabel.text = @"Spring";
        
    }
    if(indexPath.section ==3)
    {
        cell.imageView.image = [UIImage imageNamed:@"summerHome.png"];
        
        cell.textLabel.text = @"Summer";

    }
    if(indexPath.section ==4)
    {
        cell.imageView.image = [UIImage imageNamed:@"fallHome.png"];
        
        cell.textLabel.text = @"Fall";
        
    }
    if(indexPath.section==5)
    {
        
        cell.imageView.image = [UIImage imageNamed:@"winterHome.png"];
        
        cell.textLabel.text = @"Winter";
        
    }

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        cell.textLabel.font = [UIFont fontWithName:@"Verdana" size:35];
    }
    
    else
    {
        cell.textLabel.font = [UIFont fontWithName:@"Verdana" size:25];
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        [self homebtnPressed];
        
    }
    else if (indexPath.section ==1)
    {
        [self performSegueWithIdentifier:@"favourite" sender:nil];
        
    }
    else if( indexPath.section == 2)
    {
        [self springbtnPressed];
        
    }
    else if (indexPath.section ==3)
    {
        [self summerbtnPressed];
        
    }
    else if (indexPath.section ==4)
    {
        [self fallbtnPressed];

    }
    else if (indexPath.section ==5)
    {
        [self winterbtnPressed];
    }
}
#pragma mark - CoverView Methods

-(void)homebtnPressed
{
    [coverView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)springbtnPressed
{
    [coverView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:NO];
    [[NSUserDefaults standardUserDefaults]setValue:@"openrecipe" forKey:@"fromview"];
    [[NSUserDefaults standardUserDefaults]setValue:@"spring" forKey:@"recipe"];
    
}
-(void)summerbtnPressed
{
    [coverView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:NO];
    [[NSUserDefaults standardUserDefaults]setValue:@"openrecipe" forKey:@"fromview"];
    [[NSUserDefaults standardUserDefaults]setValue:@"summer" forKey:@"recipe"];
    
}

-(void)winterbtnPressed
{
    [coverView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:NO];
    [[NSUserDefaults standardUserDefaults]setValue:@"openrecipe" forKey:@"fromview"];
    [[NSUserDefaults standardUserDefaults]setValue:@"winter" forKey:@"recipe"];

}
-(void)fallbtnPressed
{
    [coverView removeFromSuperview];
    [self.navigationController popViewControllerAnimated:NO];
    [[NSUserDefaults standardUserDefaults]setValue:@"openrecipe" forKey:@"fromview"];
    [[NSUserDefaults standardUserDefaults]setValue:@"fall" forKey:@"recipe"];

}


-(void)closebtnPressed
{
    CGRect screenRect = [[UIScreen mainScreen]bounds];
    
    [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        
       
            coverTableView.frame = CGRectMake(7,30,screenRect.size.width, 0);
            
        
    } completion:^(BOOL finished)
     {
          coverView.frame = CGRectMake(0, 0, screenRect.size.width, 0);
          closebtn.hidden = YES;
     }];

}


#pragma mark - JLActionSheet Delegate


- (void) actionSheet:(JLActionSheet *)actionSheet didDismissButtonAtIndex:(NSInteger)buttonIndex

{
    
    if(buttonIndex == 4)
    {
        
                
        
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
[self addProgressIndicator];
                    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                    
                    [controller setInitialText:@"Look at what I'm cooking! More real food from the Food Truth app."];
                   [controller addURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/food-truth/id512811735?mt=8"]];
            UIImage *img;
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                img = [UIImage imageNamed:@"ipad_share_screenshot.jpg"];
            }
            else
            {
                img = [UIImage imageNamed:@"iphone_share_screenshot.jpg"];
            }

                    [controller addImage:img];
                    [controller setCompletionHandler:^(SLComposeViewControllerResult result)
                    
                    {

                        if (result == SLComposeViewControllerResultCancelled)
                        {
                            [self removeCancelProgressIndicator];
                            NSLog(@"Cancelled");
                            
                        }
                        else
                        {
                            [self removeProgressIndicator];
                            NSLog(@"Done");
                        }
                        
                    }];
        
                    
                    [self presentViewController:controller animated:YES completion:Nil];
                    
        }
        
        else
        {
//            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry" message:@"You can't share on Facebook right now, make sure your device has an internet connection and you have at least one Facebook account setup"
//                                                              delegate:self
//                                                     cancelButtonTitle:@"OK"
//                                                     otherButtonTitles:nil];
//            [alertView show];
            
            MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Sorry" description:@"You can't share on Facebook right now, make sure your device has an internet connection and you have at least one Facebook account setup" okButtonTitle:@"Settings" cancelButtonTitle:@"Ok"];
            alertView.delegate = self;
            [alertView show];
            alertView.tag = 26;
            
            

        }
        
        
            
            
        
        
//        if ([FBDialogs canPresentShareDialogWithParams:params]) {
//            
//            // Present share dialog
//            [FBDialogs presentShareDialogWithLink:params.link
//                                          handler:^(FBAppCall *call, NSDictionary *results, NSError *error) {
//                                              if(error) {
//                                                  // An error occurred, we need to handle the error
//                                                  // See: https://developers.facebook.com/docs/ios/errors
//                                                  NSLog(@"Error publishing story: %@", error.description);
//                                              } else {
//                                                  // Success
//                                                  NSLog(@"result %@", results);
//                                              }
//                                          }];
//            
//            // If the Facebook app is NOT installed and we can't present the share dialog
//        } else {
//            // FALLBACK: publish just a link using the Feed dialog
//            
//            // Put together the dialog parameters
//            NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                           @"FoodTruth", @"name",
//                                           @"Look at what I'm cooking! More real food from the Food Truth app.", @"description",
//                                           @"https://itunes.apple.com/us/app/food-truth/id512811735?mt=8", @"link",
//                                           nil];
//            
//            // Show the feed dialog
//            [FBWebDialogs presentFeedDialogModallyWithSession:nil
//                                                   parameters:params
//                                                      handler:^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
//                                                          if (error) {
//                                                              // An error occurred, we need to handle the error
//                                                              // See: https://developers.facebook.com/docs/ios/errors
//                                                              NSLog(@"Error publishing story: %@", error.description);
//                                                          } else {
//                                                              if (result == FBWebDialogResultDialogNotCompleted) {
//                                                                  // User canceled.
//                                                                  NSLog(@"User cancelled.");
//                                                              } else {
//                                                                  // Handle the publish feed callback
//                                                                  NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
//                                                                  
//                                                                  if (![urlParams valueForKey:@"post_id"]) {
//                                                                      // User canceled.
//                                                                      NSLog(@"User cancelled.");
//                                                                      
//                                                                  } else {
//                                                                      // User clicked the Share button
//                                                                      NSString *result = [NSString stringWithFormat: @"Posted story, id: %@", [urlParams valueForKey:@"post_id"]];
//                                                                      NSLog(@"result %@", result);
//                                                                  }
//                                                              }
//                                                          }
//                                                      }];
//        }
    }
    else if (buttonIndex == 3)
    {
        
        
        
        //NSLog(@"1");
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            [self addProgressIndicator];
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet setInitialText:@"Look at what I'm cooking! More real food from the Food Truth app."];
                [tweetSheet addURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/food-truth/id512811735?mt=8"]];
            UIImage *img;
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                img = [UIImage imageNamed:@"ipad_share_screenshot.jpg"];
            }
            else
            {
                img = [UIImage imageNamed:@"iphone_share_screenshot.jpg"];
            }
            [tweetSheet addImage:img];
            
            [tweetSheet setCompletionHandler:^(SLComposeViewControllerResult result) {
                
                switch (result) {
                    case SLComposeViewControllerResultCancelled:
                       // NSLog(@"Post Canceled");
                        [self removeCancelProgressIndicator];
                        break;
                    case SLComposeViewControllerResultDone:
                        //NSLog(@"Post Sucessful");
                        [self removeProgressIndicator];
                        
                        break;
                        
                    default:
                        break;
                }
            }];
            [self presentViewController:tweetSheet animated:YES completion:nil];
        }
        else
        {
            
            
            MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Sorry" description:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup" okButtonTitle:@"Settings" cancelButtonTitle:@"Ok"];
            alertView.delegate = self;
            alertView.tag = 92;
            
            [alertView show];

        }

    }
    
    else if (buttonIndex == 2)
    {
//       if([pinterest canPinWithSDK])
//        {
////        //NSURL *url = [NSURL URLWithString:@"http://teensnap.com/teensnapApi/uploads/users/1.42000779411E+12.png"];
////            NSURL *url = [[NSBundle mainBundle]
////                            URLForResource: @"iphone_share_screenshot" withExtension:@"jpg"];
////            
////        NSURL *url1 = [NSURL URLWithString:@"http://foodtruth.com"];
////
////        [pinterest createPinWithImageURL:url
////                                sourceURL:url1
////                              description:@"Look at what I'm cooking! More real food from the Food Truth app."];
//            
//            MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Sorry"
//                                                                            description:@"Pinterest won't work at this moment."
//                                                                          okButtonTitle:@"OK"];
//            alertView.delegate = self;
//            
//            
//            [alertView show];
//
//        }
//        
//        else
//        {
//            
//            MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Sorry" description:@"You can't pin right now, make sure your device has an internet connection and you have at least one Pinterest account setup" okButtonTitle:@"Settings" cancelButtonTitle:@"OK"];
//            alertView.delegate = self;
//            alertView.tag = 268492;
//            
//
//            [alertView show];
//            
//            
//        }
    }
   
    else if (buttonIndex == 1)
    {
        //NSLog(@"3");
        if ([MFMailComposeViewController canSendMail])
        {
        mailComposer = [[MFMailComposeViewController alloc]init];
        mailComposer.mailComposeDelegate = self;
        [mailComposer setSubject:@"Food Truth"];
            UIImage *img;
            
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            {
                img = [UIImage imageNamed:@"ipad_share_screenshot.jpg"];
            }
            else
            {
                img = [UIImage imageNamed:@"iphone_share_screenshot.jpg"];
            }

            [mailComposer addAttachmentData:UIImageJPEGRepresentation(img, 1.0)
                                            mimeType:@"image/jpg"
                                            fileName:@"attachment.jpg"];

        [mailComposer setMessageBody:@"Look at what I'm cooking! More real food from the Food Truth app.\n\n https://itunes.apple.com/us/app/food-truth/id512811735?mt=8" isHTML:NO];
         [self presentViewController:mailComposer animated:YES completion:nil];
        }
        else
        {
        
            
            MODropAlertView *alertView = [[MODropAlertView alloc]initDropAlertWithTitle:@"Sorry" description:@"You can't E-mail right now, make sure your device has an internet connection and you have at least one E-mail account setup" okButtonTitle:@"Settings" cancelButtonTitle:@"Ok"];
            alertView.delegate = self;
            alertView.tag = 2684;
            
            
            [alertView show];

        }
    }
}

#pragma mark - MailComposer Delegate

-(void)mailComposeController:(MFMailComposeViewController *)controller
         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (result) {
        NSLog(@"Result : %d",result);
    }
    if (error) {
        NSLog(@"Error : %@",error);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (NSMutableArray*) getButtonTitles
{
    NSMutableArray* buttonTitles = [[NSMutableArray alloc] initWithCapacity:4];
    buttonTitles[0] = @"Facebook";
    buttonTitles[1] = @"Twitter";
    buttonTitles[2] = @"Pinterest";
    buttonTitles[3] = @"E-mail";
    return buttonTitles;


}

#pragma mark - Progress Indicator

-(void)addProgressIndicator
{
    progresshud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progresshud.labelText = @"Sharing Food Truth...";
    
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

-(void)removeCancelProgressIndicator
{
    [progresshud removeFromSuperview];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    progresshud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progresshud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cross.png"]];
    
    progresshud.mode = MBProgressHUDModeCustomView;
    progresshud.delegate = self;
    progresshud.labelText = @"Cancelled";
    [progresshud show:YES];
    [progresshud hide:YES afterDelay:2];
    
}

- (void)alertViewDidDisappear:(MODropAlertView *)alertView buttonType:(DropAlertButtonType)buttonType
{
    if(alertView.tag == 26 && buttonType ==  DropAlertButtonOK)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
    
    else if (alertView.tag == 92 && buttonType ==  DropAlertButtonOK)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
    
    else if (alertView.tag == 2684 && buttonType == DropAlertButtonOK)
    {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
    
    else if (alertView.tag == 268492 && buttonType == DropAlertButtonOK)
    {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
}
@end
