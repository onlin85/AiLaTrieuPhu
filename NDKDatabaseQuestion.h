//
//  NDKDatabaseQuestion.h
//  AiLaTrieuPhu
//
//  Created by duykien on 8/4/13.
//  Copyright (c) 2013 D&K. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface NDKDatabaseQuestion : NSObject
{
    sqlite3 *database;
}
+(NDKDatabaseQuestion *)sharedDatabase;
-(NSArray *)getQuestions;
-(NSArray*)getHighScores;

@end
