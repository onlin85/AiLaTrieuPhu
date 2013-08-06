//
//  NDKStartView.m
//  AiLaTrieuPhu_KienND3_V01
//
//  Created by duykien on 7/30/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKStartView.h"
#import "NDKMainView.h"
#import "NDKDatabaseQuestion.h"
#import "NDKQuestionObject.h"
#import "AudioLoadView.h"
//#import "UIViewController+MJPopupViewController.h"
//#import "NDKHelpKGPopUp.h"
@interface NDKStartView ()

@end

@implementation NDKStartView
static int check = 0;
static NSArray * question;
static NSString *rightAnswer;
static int questionIndex = 0;
static int randomIndexAnswer;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//
// HongPH: Hàm này được sử dụng để tính điểm trong chương trình ai là triệu phú
// qIndex: số thứ tự của câu hỏi (tính từ 0)
//
- (int) TinhDiem : (int)qIndex
{
    int tienThuong[11];
    tienThuong[0]=200000;
    tienThuong[1]=400000;
    tienThuong[2]=600000;
    tienThuong[3]=1000000;
    tienThuong[4]=2000000;
    tienThuong[5]=3000000;
    tienThuong[6]=6000000;
    tienThuong[7]=10000000;
    tienThuong[8]=14000000;
    tienThuong[9]=22000000;
    tienThuong[10]=30000000;
    
    
    
    if (qIndex==0)
        return 0;
    else
    {
        return tienThuong[qIndex];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
   // [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
    //[_btnA setTitle:@"Kien Ngo" forState:(UIControlStateNormal|UIControlStateApplication|UIControlStateHighlighted)];
    _questionLabel.numberOfLines=7;
    
    [self loadQuestion];
     ++questionIndex;
    NSString *stringIndex = [NSString stringWithFormat:@"%d", questionIndex];
    _numQuest.text = stringIndex;

}
-(void)loadQuestion{
    question = [[NDKDatabaseQuestion sharedDatabase]getQuestions];
    
    int numQuest = [question count];
    NSLog(@"NUm Quest %d",numQuest);
    
    //  NDKQuestionObject *questInfo = [question objectAtIndex:5];
    // _questionLabel.text= questInfo.answerS1;
    // NSLog(@" Question %@  ",questInfo.answerS1);
    int randomQuest;
    randomQuest = arc4random()%numQuest;
    NSLog(@"Random Question %d",randomQuest);
    NDKQuestionObject *questInfo = [question objectAtIndex:randomQuest];
    _questionLabel.text=questInfo.question;
    rightAnswer = questInfo.answertrue;
    randomIndexAnswer = arc4random()%3;
    
    if(randomIndexAnswer == 0){
        [_btnA setTitle:questInfo.answerS1 forState:UIControlStateNormal];
        [_btnB setTitle:questInfo.answerS2 forState:UIControlStateNormal];
        [_btnC setTitle:questInfo.answerS3 forState:UIControlStateNormal];
        [_btnD setTitle:questInfo.answertrue forState:UIControlStateNormal];
    }else if(randomIndexAnswer == 1){
        [_btnD setTitle:questInfo.answerS1 forState:UIControlStateNormal];
        [_btnB setTitle:questInfo.answerS2 forState:UIControlStateNormal];
        [_btnC setTitle:questInfo.answerS3 forState:UIControlStateNormal];
        [_btnA setTitle:questInfo.answertrue forState:UIControlStateNormal];
    }else if(randomIndexAnswer == 2){
        [_btnA setTitle:questInfo.answerS1 forState:UIControlStateNormal];
        [_btnD setTitle:questInfo.answerS2 forState:UIControlStateNormal];
        [_btnC setTitle:questInfo.answerS3 forState:UIControlStateNormal];
        [_btnB setTitle:questInfo.answertrue forState:UIControlStateNormal];
    }else{
        [_btnB setTitle:questInfo.answerS1 forState:UIControlStateNormal];
        [_btnA setTitle:questInfo.answerS2 forState:UIControlStateNormal];
        [_btnD setTitle:questInfo.answerS3 forState:UIControlStateNormal];
        [_btnC setTitle:questInfo.answertrue forState:UIControlStateNormal];
    }
    
    [_btnA setCenter:CGPointMake(150, 210)];
    [_btnB setCenter:CGPointMake(150, 255)];
    [_btnC setCenter:CGPointMake(150, 320)];
    [_btnD setCenter:CGPointMake(150, 365)];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];

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
    //UIAlertView *alert = [[[UIAlertView alloc]initWithTitle:nil message:@"Bạn muốn sử dụng sự giải thoát /50/50?" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"NO",nil]autorelease];
   //[alert show];
    int randomHidden = arc4random()%3;
    NSLog(@"Random Hidden %d",randomHidden);
    
    if (randomIndexAnswer == 0) {
        _btnD.hidden=NO;
        _btnB.hidden=YES;
        _btnC.hidden=YES;
    }else if(randomIndexAnswer == 1){
        _btnA.hidden=NO;
        _btnB.hidden=YES;
        _btnD.hidden=YES;
    }else if (randomIndexAnswer==2){
        _btnB.hidden=NO;
        _btnC.hidden=YES;
        _btnA.hidden=YES;
    }else{
        _btnC.hidden=NO;
        _btnA.hidden=YES;
        _btnB.hidden=YES;
    }
    _btn50_50.hidden=YES;
}
- (void)dealloc {
    [_btnA release];
    [_btnB release];
    [_btnC release];
    [_btnD release];
    [_labelTime release];
    [_questionLabel release];
    [_labelTime release];
    [_soundSet release];
    [_numQuest release];
    [_changeQuestion release];
    [_btn50_50 release];
    [super dealloc];
}
- (IBAction)btnMuteVolumne:(id)sender {
    check++;
    audioLoad = [[AudioLoadView sharedObject]init];
    if(check%2!=0){
        [audioLoad stopAudio];
      //  [_soundSet setBackgroundImage:@"speakermute32.png" forState:UIControlStateNormal];
    }else{
        [audioLoad playAudio];
       // [_soundSet setBackgroundImage:@"speaker32.png" forState:UIControlStateNormal];
    }
}
- (IBAction)btnHomeBack:(id)sender {
    NDKMainView *main = [[[NDKMainView alloc]initWithNibName:@"NDKMainView" bundle:nil]autorelease];
    [self.navigationController pushViewController:main animated:YES];
    //[self.view removeFromSuperview];

}


- (IBAction)btnRefresh:(id)sender {
    [self performSelector:@selector(loadQuestion)];
    _changeQuestion.hidden=YES;
}

- (IBAction)btnHelpKG:(id)sender {
   // NDKHelpKGPopUp *detailHelp = [[NDKHelpKGPopUp alloc]initWithNibName:@"NDKHelpKGPopUp" bundle:nil];
   // [self presentPopupViewController:detailHelp animationType:1];

}
@end
