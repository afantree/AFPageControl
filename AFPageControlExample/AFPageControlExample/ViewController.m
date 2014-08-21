//
//  ViewController.m
//  AFPageControlExample
//
//  Created by 阿凡树( http://blog.afantree.com ) on 14-8-21.
//  Copyright (c) 2014年 ManGang. All rights reserved.
//

#import "ViewController.h"
#import "AFPageControl.h"
@interface ViewController ()
{
    AFPageControl     *_pageControl;
    AFPageControl     *_star;
    
    int                _index;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _pageControl = [[AFPageControl alloc] initWithFrame:CGRectMake(10, 40, 120, 20) withHighlightImage:[UIImage imageNamed:@"star_h"] andNormalImage:[UIImage imageNamed:@"star_n"] andImageSize:CGSizeMake(20, 20)];
    _pageControl.numberOfPages = 5;
    _pageControl.currentPage = 0;
    [self.view addSubview:_pageControl];
    
    _star = [[AFPageControl alloc] initWithFrame:CGRectMake(10, 80, 120, 20) withHighlightImage:[UIImage imageNamed:@"star_h"] andNormalImage:[UIImage imageNamed:@"star_n"] andImageSize:CGSizeMake(20, 20)];
    _star.numberOfPages = 5;
    _star.currentPage = 0;
    _star.isStarShow = YES;
    [self.view addSubview:_star];
    
    _index = 0;
    [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(count) userInfo:nil repeats:YES];
}

- (void)count
{
    _index ++;
    if (_index == 5) {
        _index = 0;
    }
    _pageControl.currentPage = _index;
    _star.currentPage = _index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
