//
//  NDKDatabaseQuestion.m
//  AiLaTrieuPhu
//
//  Created by duykien on 8/4/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import "NDKDatabaseQuestion.h"
#import "NDKQuestionObject.h"
#import "NDKHighScore.h"
@implementation NDKDatabaseQuestion
static NDKDatabaseQuestion *sharedDatabase;
static NSString *queryQuestion;
static NSString *queryHighScores;
+(NDKDatabaseQuestion *)sharedDatabase{
    if (sharedDatabase == nil) {
        sharedDatabase = [[NDKDatabaseQuestion alloc]init];
    }
    return sharedDatabase;
}
-(id)init{
    self=[super init];
    if(self){
        if(self)
        {
            NSString *sqliteDB=[[NSBundle mainBundle]pathForResource:@"AiLaTrieuPhu" ofType:@"sqlite3"];
            NSLog(@"Path db : %@",sqliteDB);
            if(sqlite3_open([sqliteDB UTF8String], &database)!=SQLITE_OK){
                NSLog(@"Failed to open database");
            }else {
                NSLog(@"Database opened");
            }
        }
    }
    return self;
}
-(NSArray* )getQuestions{
    NSMutableArray *returnArray=[[NSMutableArray alloc]init];
    queryQuestion=@"select *from question";
    NSLog(@"%@",queryQuestion);
    sqlite3_stmt *statement;
    NSLog(@" %d",sqlite3_prepare_v2(database, [queryQuestion UTF8String],-1, &statement,nil));
    if(sqlite3_prepare_v2(database, [queryQuestion UTF8String],-1, &statement,nil)==SQLITE_OK)
    {
        NSLog(@"Database OK");
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            int position=sqlite3_column_int(statement, 0);
            char *questionC=(char *)sqlite3_column_text(statement, 1);
            char *answerTrueC=(char *)sqlite3_column_text(statement, 2);
            char *answer1C=(char *)sqlite3_column_text(statement, 3);
            char *answer2C=(char *)sqlite3_column_text(statement, 4);
            char *answer3C=(char *)sqlite3_column_text(statement, 5);
            char *diffC=(char *)sqlite3_column_text(statement, 6);
            
            NSString *question=[[NSString alloc]initWithUTF8String:questionC ];
            NSString *answertrue=[[NSString alloc]initWithUTF8String:answerTrueC];
            NSString *answer1=[[NSString alloc]initWithUTF8String:answer1C];
            NSString *answer2=[[NSString alloc]initWithUTF8String:answer2C];
            NSString *answer3=[[NSString alloc]initWithUTF8String:answer3C];
            NSString *difficult=[[NSString alloc]initWithUTF8String:diffC];
            
            NDKQuestionObject *questionObject = [[NDKQuestionObject alloc]initWithPosition:position question:question answerTrue:answertrue answerS1:answer1 answer2:answer2 answer3:answer3 difficult:difficult];
            [returnArray addObject:questionObject];
            
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"DIe roi, khong ket noi duoc roi");
    }
    return returnArray;

}
-(NSArray*)getHighScores{
    NSMutableArray *returnArray = [[NSMutableArray alloc]init];
    queryHighScores = @"Select * from player";
    NSLog(@"QueryPlayer %@",queryHighScores);
    sqlite3_stmt * statement;
     NSLog(@" %d",sqlite3_prepare_v2(database, [queryHighScores UTF8String],-1, &statement,nil));
    if(sqlite3_prepare_v2(database, [queryHighScores UTF8String],-1, &statement,nil)==SQLITE_OK){
        NSLog(@" Database HighScore OK");
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            NSLog(@"Row HighScore OK");
            int tempScore = sqlite3_column_int(statement, 0);
            char *userNameC = (char*)sqlite3_column_text(statement, 1);
        
            NSString*userName = [[NSString alloc]initWithUTF8String:userNameC];
        
            NDKHighScore *obj = [[NDKHighScore alloc]initWithHighScores:tempScore userName1:userName];
            [returnArray addObject:obj];
        }
        sqlite3_finalize(statement);
    }else{
        NSLog(@"DIe roi, khong ket noi duoc roi");
    }
    return returnArray;
}
-(void)dealloc{
    sqlite3_close(database);
    [super dealloc];
}
@end
