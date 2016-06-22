//
//  TestJSObject.m
//  javascript-oc
//
//  Created by Linyou-IOS-1 on 16/6/22.
//  Copyright © 2016年 TGSDK. All rights reserved.
//

#import "TestJSObject.h"

@implementation TestJSObject
-(void)TestNOParameter
{
    NSLog(@"this is ios TestNOParameter");
}
-(void)TestOneParameter:(NSString *)message
{
    NSLog(@"this is ios TestOneParameter=%@",message);
}
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2
{
    NSLog(@"this is ios TestTowParameter=%@  Second=%@",message1,message2);
}

@end
