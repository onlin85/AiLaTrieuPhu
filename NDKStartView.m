//
//  NDKStartView.m
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKStartView.h"
#import "NDKMainView.h"
@interface NDKStartView ()

@end

@implementation NDKStartView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    //[_btnA setTitle:@"Kien Ngo" forState:(UIControlStateNormal|UIControlStateApplication|UIControlStateHighlighted)];
    [_btnA setTitle:@"Normal" forState:UIControlStateNormal];
    [_btnA setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

-(void)updateTimer:(NSTimer*)theTimer{
    static int count = 10;
    count -=1;
    if(count >0){
        NSString *stringS = [[[NSString alloc]initWithFormat:@"%d",count]autorelease];
        self.labelTime.text=stringS;
    }
    if(count == 0){
        UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:@"Thông Báo" message:@"Bạn đã hết thời gian câu trả lời" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]autorelease];
        [alert show];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnChangeQuestion:(id)sender {
    //UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:nil message:@"Bạn muốn thay đổi câu hỏi ?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO",nil]autorelease];
   // [alert show];
   
}

- (IBAction)btnKhanGia:(id)sender {
   // UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:nil message:@"Bạn muốn hỏi ý kiến khán giả trong /trường quay ?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO",nil]autorelease];
    //[alert show];
}

- (IBAction)btnCall:(id)sender {
   // UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:nil message:@"Bạn muốn gọi điện thoại cho người thân?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO",nil]autorelease];
   // [alert show];
}

- (IBAction)btn50_50:(id)sender {
  //  UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:nil message:@"Bạn muốn sử dụng sự giải thoát /50/50?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO",nil]autorelease];
  //  [alert show];
}
- (void)dealloc {

    [_timeLabel release];
    [_btnA release];
    [_btnB release];
    [_btnC release];
    [_btnD release];
    [_labelTime release];
    [super dealloc];
}
- (IBAction)btnHome:(id)sender {
    NDKMainView *main = [[[NDKMainView alloc]initWithNibName:@"NDKMainView" bundle:nil]autorelease];
    [self.navigationController pushViewController:main animated:YES];
}
@end
