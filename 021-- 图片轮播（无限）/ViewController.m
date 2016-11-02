//
//  ViewController.m
//  021-- 图片轮播（无限）
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "GXFLoopView.h"

@interface ViewController ()

@end

@implementation ViewController {
    
    NSMutableArray *_images;
//    UIPageControl *_pageControl;
    GXFLoopView *_loopView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     1. 请求数据，定义数组保存数据
     2. 自定义轮播视图loopView
        定义方法- (instancetype)initWithImages:(NSArray *)images;把images传过去，在此方法中设置代理、注册cell
     3. 自定义flowLayout
        设置一系列与cell布局有关的代码
        同时也可以在这里设置flowLayout附属的collectionView的属性
     4. 自定义cell，定义image属性，重写setter方法，在setter方法中给cell的imageView赋值
     5. 把pageControl定义在loopView，添加pageControl到控制器的view上
        scrollViewDidScroll方法中设置loopView的pageControl，
     6. 把定时器定义在loopView，每隔一秒row++，当row==3时，section++，由于在scrollViewDidScroll方法中已经实现了无限轮播，所以这里的section会自动调整，让它先滚到第6组第1个，然后无动画的滚到第5组第1个
     7. 开始拖拽时暂停定时器，停止减速后scrollViewDidEndDecelerating，开启定时器方法中开启定时器（由于自动滚动也会走这个方法，可以加一个判断，如果self.timer == nil 才开启定时器）
     
     */
    
    [self loadData];
    
    _loopView = [[GXFLoopView alloc] initWithImages:_images];
    [self.view addSubview:_loopView];
    [_loopView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(20);
        make.height.mas_equalTo(200);
    }];
    
    
    // 添加pageControl
//    _pageControl = [[UIPageControl alloc] init];
//    _pageControl.numberOfPages = _images.count;
//    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
//    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    [self.view addSubview:_pageControl];
//    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.centerX.equalTo(self.view);
//        make.top.equalTo(self.view).offset(200);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(30);
//    }];
    
//    [self setCurrentPage];
    
    UIPageControl *pageControl = _loopView.pageControl;
    
    [self.view addSubview:pageControl];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(200);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
}

//- (void)setCurrentPage {
//    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        
//        _pageControl.currentPage = -_loopView.currentPage;
//        GXFLog(@"%zd", _loopView.currentPage);
//    }];
//    
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//}

- (void)loadData {
    
    _images = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 3; i++) {
        
        NSString *imageString = [NSString stringWithFormat:@"%02zd.png", i + 1];
        UIImage *image = [UIImage imageNamed:imageString];
        
        [_images addObject:image];
    }
    
    NSLog(@"%@", _images);
    
}

@end
