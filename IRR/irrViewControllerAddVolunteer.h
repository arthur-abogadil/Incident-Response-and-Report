//
//  irrViewControllerAddVolunteer.h
//  IRR
//
//  Created by Arthur on 12/4/13.
//  Copyright (c) 2013 philcoders. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface irrViewControllerAddVolunteer : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *txtfirstname;
@property (nonatomic, strong) IBOutlet UITextField *txtlastname;
@property (nonatomic, strong) IBOutlet UITextField *txtskillset;
@property (nonatomic, strong) IBOutlet UITextField *txtcontactnumber;
@property (nonatomic, strong) IBOutlet UITextField *txtemail;







@property (nonatomic,strong) IBOutlet UIPickerView *myPickerView;
@property (nonatomic, strong) NSArray *itemsArray;

@property (nonatomic,strong) IBOutlet UIButton *addVolunteer;

-(IBAction)buttonPressed:(id)sender;




@end
