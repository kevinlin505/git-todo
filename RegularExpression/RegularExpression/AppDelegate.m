//
//  AppDelegate.m
//  RegularExpression
//
//  Created by Kevin Lin on 9/30/15.
//  Copyright © 2015 Kevin Lin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    NSLog(@"1");
    
    NSArray *filteredArray = [self regexFilterWithArray:@[@"Hello", @"I'm", @"fee fe", @"32527e574", @"3421", @"325.432", @"World", @"{}()[]", @"<>?:'", @"ferf-fw"]];
    NSString *alphaNumeric = [self alphaNumericWithString:@"fef2354fd3.eger˜`!@#$%ˆ&*()-_+=<,>>.?/?:;\"\'|\\}]{[g23rr/#395FRG';,<AFOsfwjbefwejf"];
    NSString *filteredString = [self symbolFilteringWithString:@"fef2354fd3.eger˜`!@#$%ˆ&*()-_+=<,>>.?/?:;\"\'|\\}]{[g23rr/#395FRG';,<AFOsfwjbefwejf"];
    
    NSLog(@"filtered Array: %@", filteredArray);
    NSLog(@"AlphaNumeric: %@", alphaNumeric);
    NSLog(@"filtered: %@", filteredString);
    
    return YES;
}

-(NSArray *)regexFilterWithArray:(NSArray *)array{
    
    NSString *regex = @"[a-z]*[- ']*[a-z]*";
    NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", regex];
    NSArray *tempArray = [array filteredArrayUsingPredicate:filterPredicate];
    
    return tempArray;
}

-(NSString *)alphaNumericWithString:(NSString *)string{
    
    NSCharacterSet *symbols = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    return [[string componentsSeparatedByCharactersInSet:symbols] componentsJoinedByString:@""];
}

-(NSString *)symbolFilteringWithString:(NSString *)string{
    
    NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:@"[.,-;:?!'<>{}˜`@#$%|ˆ&*_+=/ \\\\\\(\\)\"\\]\\[\\d]" options:0 error:nil];
    NSString *cleanString = [regEx stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@""];
    
    return cleanString;
}


@end
