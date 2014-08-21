//
//  AFPageControlCustom.m
//  AFCommon
//
//  Created by 阿凡树( http://blog.afantree.com ) on 13-2-24.
//  Copyright (c) 2013年 ManGang. All rights reserved.
//

#import "AFPageControl.h"
#define SPACE_BETWEEN   5.0

@implementation AFPageControl
@synthesize currentPage   = _currentPage;
@synthesize numberOfPages = _numberOfPages;
@synthesize spaceBetween  = _spaceBetween;

//初始化
- (id)initWithFrame:(CGRect)frame withHighlightImage:(UIImage*)highlightImage andNormalImage:(UIImage*)normalImage andImageSize:(CGSize)imageSize;
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        //初始化
        _highlightImage=highlightImage;
        _normalImage=normalImage;
        _imageSize=imageSize;
        
        _currentPage=0;
        _numberOfPages=0;
        _imageViewArray=[[NSMutableArray alloc] init];
        
        _spaceBetween = 5.0f;
        _isStarShow = NO;
    }
    return self;
}
//imageView的自调整
-(void)rechangeFrameImageView
{
    //两个图片之间的距离
    CGFloat placeHeartToHeart=_spaceBetween + _imageSize.width;
    //NSLog(@"self=(%f,%f)",self.center.x,self.center.y);
    for (int i=0; i<_imageViewArray.count; i++) {
        UIImageView* iv = [_imageViewArray objectAtIndex:i];
        iv.center=CGPointMake(self.center.x + ((2*i+1-_numberOfPages)/2.0f*placeHeartToHeart) - self.frame.origin.x, _imageSize.height/2.0f);
        //NSLog(@"(%f,%f)",iv.center.x,iv.center.y);
    }
}
//重写
-(void)setCurrentPage:(NSInteger)currentPage
{
    if (currentPage < _numberOfPages) {
        if (_isStarShow) {
            for(int i=0 ; i<_numberOfPages ;i++) {
                UIImageView* iv=[_imageViewArray objectAtIndex:i];
                if (i <= currentPage) {
                    iv.highlighted = YES;
                }
                else {
                    iv.highlighted = NO ;
                }
            }
        }
        else{
            for(int i=0 ; i<_numberOfPages ;i++) {
                UIImageView* iv=[_imageViewArray objectAtIndex:i];
                if (i == currentPage) {
                    iv.highlighted = YES;
                }
                else {
                    iv.highlighted = NO ;
                }
            }
        }
        //存取当前的值
        _currentPage=currentPage;
    }
    else {
        return;
    }
}
-(void)setNumberOfPages:(NSInteger)numberOfPages
{
    if (_numberOfPages < numberOfPages) {
        //应该添加
        for (int i=0; i< numberOfPages - _numberOfPages; i++) {
            UIImageView* iv=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _imageSize.width, _imageSize.height)];
            iv.image=_normalImage;
            iv.highlightedImage=_highlightImage;
            //NSLog(@"%d",i);
            [_imageViewArray addObject:iv];
            [self addSubview:iv];
        }
    }
    else if (_numberOfPages > numberOfPages) {
        //设置的数目小了，应该减去
        for (int i=0; i< _numberOfPages - numberOfPages; i++) {
            UIImageView* iv=[_imageViewArray objectAtIndex:i];
            iv.image=nil;
            [iv removeFromSuperview];
        }
        NSRange deleteRange=NSMakeRange(0,_numberOfPages - numberOfPages);
        [_imageViewArray removeObjectsInRange:deleteRange];
    }
    else {
        return;
    }
    //最后的赋值
    _numberOfPages=numberOfPages;
    [self rechangeFrameImageView];
    [self setCurrentPage:0];
    
}
-(void)dealloc
{
    _highlightImage = nil;
    _normalImage = nil;
    for (UIImageView* iv in _imageViewArray) {
        iv.image=nil;
    }
    _imageViewArray = nil;
}

@end
