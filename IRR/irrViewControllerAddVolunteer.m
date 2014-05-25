//
//  irrViewControllerAddVolunteer.m
//  IRR
//
//  Created by Arthur on 12/4/13.
//  Copyright (c) 2013 philcoders. All rights reserved.
//

#import "irrViewControllerAddVolunteer.h"
#import <Parse/Parse.h>


@interface irrViewControllerAddVolunteer ()

@end

@implementation irrViewControllerAddVolunteer

@synthesize myPickerView;
@synthesize itemsArray;
@synthesize addVolunteer;

@synthesize txtfirstname;
@synthesize txtlastname;
@synthesize txtskillset;
@synthesize txtcontactnumber;
@synthesize txtemail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - UIPickerView DataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [itemsArray count];
}

#pragma mark - UIPickerView Delegate
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30.0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [itemsArray objectAtIndex:row];
}

int irow = 0;
//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    irow = row;
    //Let's print in the console what the user had chosen;
    NSLog(@"Chosen item: %@", [itemsArray objectAtIndex:row]);
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    itemsArray = [[NSArray alloc] initWithObjects:@"Barangay I", @"Brangay II", @"Barangay III", @"Barangay IV", @"Barangay V", @"Barangay VI", @"Barangay VII", @"Barangay VIII", @"Barangay IX",@"Barangay X", nil];

    myPickerView.delegate = self;
    myPickerView.dataSource = self;
	// Do any additional setup after loading the view.
}


-(IBAction)buttonPressed:(id)sender{
    
    
    PFObject *testObject = [PFObject objectWithClassName:@"Volunteer"];
    [testObject setObject:[itemsArray objectAtIndex:irow] forKey:@"location"];
    [testObject setObject:[txtfirstname text] forKey:@"firstname"];
    [testObject setObject:[txtlastname text] forKey:@"lastname"];
    [testObject setObject:[txtcontactnumber text] forKey:@"contactnumber"];
    [testObject setObject:[txtemail text] forKey:@"email"];
    [testObject setObject:[txtskillset text] forKey:@"skillset"];
    
    [testObject save];
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"IRR"
                                                      message: @"Data Saved!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
