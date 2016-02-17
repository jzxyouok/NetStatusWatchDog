//
//  ViewController.m
//  NetStatusWatchDog
//
//  Created by loginSin on 16/2/16.
//  Copyright © 2016年 loginSin. All rights reserved.
//

#import "ViewController.h"

#import "QINetReachabilityManager.h"
#import "QIReachability.h"

@interface ViewController ()
@property (nonatomic,strong) QIReachability *networkConn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    QINetReachabilityManager *manager = [QINetReachabilityManager sharedInstance];
    
    QINetReachabilityStatus status = (QINetReachabilityStatus)[manager currentNetReachabilityStatus];
    
    if(status == QINetReachabilityStatusNotReachable){
        NSLog(@"没有网络");
    }else if (status == QINetReachabilityStatusWIFI){
        NSLog(@"wifi");
    }else if (status == QINetReachabilityStatusWWAN){
        NSLog(@"4G/3G");
    }
    
    [manager currentNetStatusChangedBlock:^(QINetReachabilityStatus currentStatus) {
        if(currentStatus == QINetReachabilityStatusNotReachable){
            NSLog(@"没有网络");
        }else if (currentStatus == QINetReachabilityStatusWIFI){
            NSLog(@"wifi");
        }else if (currentStatus == QINetReachabilityStatusWWAN){
            NSLog(@"4G/3G");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
