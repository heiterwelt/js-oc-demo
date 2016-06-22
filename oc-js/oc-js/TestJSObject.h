//
//  TestJSObject.h
//  javascript-oc
//
//  Created by Linyou-IOS-1 on 16/6/22.
//  Copyright © 2016年 TGSDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol TestJSObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)TestNOParameter;
-(void)TestOneParameter:(NSString *)message;
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2;

@end
@interface TestJSObject : NSObject<TestJSObjectProtocol>

@end
