//
//  ViewController.m
//  javascript-oc
//
//  Created by Linyou-IOS-1 on 16/6/22.
//  Copyright © 2016年 TGSDK. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *myWebView;
}
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    myWebView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 22, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-22)];
    myWebView.delegate=self;
    //添加webview到当前viewcontroller的view上
    [self.view addSubview:myWebView];
    
    //网址
    NSString *httpStr=@"https://www.baidu.com";
    NSURL *httpUrl=[NSURL URLWithString:httpStr];
    NSURLRequest *httpRequest=[NSURLRequest requestWithURL:httpUrl];
    [myWebView loadRequest:httpRequest];
    // Do any additional setup after loading the view, typically from a nib.
}


-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //网页加载之前会调用此方法
    
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //开始加载网页调用此方法
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *alertJS=@"alert('test js OC')"; //准备执行的js代码
//    [context evaluateScript:alertJS];//通过oc方法调用js的alert
//    //网页加载完成调用此方法
//    
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    
//    //js调用iOS
//    //第一种情况
//    //其中test1就是js的方法名称，赋给是一个block 里面是iOS代码
//    //此方法最终将打印出所有接收到的参数，js参数是不固定的 我们测试一下就知道
//    context[@"test1"] = ^() {
//        NSArray *args = [JSContext currentArguments];
//        for (id obj in args) {
//            NSLog(@"%@",obj);
//        }
//    };
//    //此处我们没有写后台（但是前面我们已经知道iOS是可以调用js的，我们模拟一下）
//    //首先准备一下js代码，来调用js的函数test1 然后执行
//    //一个参数
//    NSString *jsFunctStr=@"test1('参数1')";
//    [context evaluateScript:jsFunctStr];
//    
//    //二个参数
//    NSString *jsFunctStr1=@"test1('参数a','参数b')";
//    [context evaluateScript:jsFunctStr1];
    
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //第二种情况，js是通过对象调用的，我们假设js里面有一个对象 testobject 在调用方法
    //首先创建我们新建类的对象，将他赋值给js的对象
    TestJSObject *testJO=[TestJSObject new];
    context[@"testobject"]=testJO;

    
    //同样我们也用刚才的方式模拟一下js调用方法
    NSString *jsStr1=@"testobject.TestNOParameter()";
    [context evaluateScript:jsStr1];
    NSString *jsStr2=@"testobject.TestOneParameter('参数1')";
    [context evaluateScript:jsStr2];
    NSString *jsStr3=@"testobject.TestTowParameterSecondParameter('参数A','参数B')";
    [context evaluateScript:jsStr3];
    
   
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //网页加载失败 调用此方法
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
