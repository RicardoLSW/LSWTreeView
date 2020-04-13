//
//  LSWViewController.m
//  LSWTreeView
//
//  Created by Ricardo on 04/13/2020.
//  Copyright (c) 2020 Ricardo. All rights reserved.
//

#import "LSWViewController.h"
#import "LSWTreeView.h"

@interface LSWViewController ()

@end

@implementation LSWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *data = @[
            @{
                    @"name": @"第1级第1个",
                    @"currentId": @"1",
                    @"children": @[
                    @{
                            @"name": @"第2级第1个",
                            @"currentId": @"121",
                            @"parentId": @"1",
                            @"children": @[
                            @{
                                    @"name": @"第3级第1个",
                                    @"currentId": @"131",
                                    @"parentId": @"121",
                            },
                            @{
                                    @"name": @"第3级第2个",
                                    @"currentId": @"132",
                                    @"parentId": @"121",
                            },
                            @{
                                    @"name": @"第3级第3个",
                                    @"currentId": @"133",
                                    @"parentId": @"121",
                            },
                    ]
                    },
                    @{
                            @"name": @"第2级第2个",
                            @"currentId": @"122",
                            @"parentId": @"1",
                    },
                    @{
                            @"name": @"第2级第3个",
                            @"currentId": @"123",
                            @"parentId": @"1",
                    },
            ]
            },
            @{
                    @"name": @"第1级第2个",
                    @"currentId": @"2",
                    @"children": @[
                    @{
                            @"name": @"第2级第1个",
                            @"currentId": @"221",
                            @"parentId": @"2",
                            @"children": @[
                            @{
                                    @"name": @"第3级第1个",
                                    @"currentId": @"231",
                                    @"parentId": @"221",
                            },
                            @{
                                    @"name": @"第3级第2个",
                                    @"currentId": @"232",
                                    @"parentId": @"221",
                            },
                            @{
                                    @"name": @"第3级第3个",
                                    @"currentId": @"233",
                                    @"parentId": @"221",
                            },
                    ]
                    },
                    @{
                            @"name": @"第2级第2个",
                            @"currentId": @"222",
                            @"parentId": @"2",
                    },
                    @{
                            @"name": @"第2级第3个",
                            @"currentId": @"223",
                            @"parentId": @"2",
                    },
            ]
            },
            @{
                    @"name": @"第1级第3个",
                    @"currentId": @"3",
                    @"children": @[
                    @{
                            @"name": @"第2级第1个",
                            @"currentId": @"321",
                            @"parentId": @"3",
                            @"children": @[
                            @{
                                    @"name": @"第3级第1个",
                                    @"currentId": @"331",
                                    @"parentId": @"321",
                            },
                            @{
                                    @"name": @"第3级第2个",
                                    @"currentId": @"332",
                                    @"parentId": @"321",
                            },
                            @{
                                    @"name": @"第3级第3个",
                                    @"currentId": @"333",
                                    @"parentId": @"321",
                            },
                    ]
                    },
                    @{
                            @"name": @"第2级第2个",
                            @"currentId": @"322",
                            @"parentId": @"3",
                    },
                    @{
                            @"name": @"第2级第3个",
                            @"currentId": @"323",
                            @"parentId": @"3",
                    },
            ]
            },
            @{
                    @"name": @"第1级第4个",
                    @"currentId": @"4",
                    @"children": @[
                    @{
                            @"name": @"第2级第1个",
                            @"currentId": @"421",
                            @"parentId": @"4",
                            @"children": @[
                            @{
                                    @"name": @"第3级第1个",
                                    @"currentId": @"431",
                                    @"parentId": @"421",
                            },
                            @{
                                    @"name": @"第3级第2个",
                                    @"currentId": @"432",
                                    @"parentId": @"421",
                            },
                            @{
                                    @"name": @"第3级第3个",
                                    @"currentId": @"433",
                                    @"parentId": @"421",
                            },
                    ]
                    },
                    @{
                            @"name": @"第2级第2个",
                            @"currentId": @"422",
                            @"parentId": @"4",
                    },
                    @{
                            @"name": @"第2级第3个",
                            @"currentId": @"423",
                            @"parentId": @"4",
                    },
            ]
            }
    ];
    
    LSWTreeView *treeView = [[LSWTreeView alloc] initWithData:data frame:[UIScreen mainScreen].bounds];
    [self.view addSubview:treeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
