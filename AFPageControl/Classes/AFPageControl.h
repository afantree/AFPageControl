//
//  AFPageControlCustom.h
//  AFCommon
//
//  Created by 阿凡树( http://blog.afantree.com ) on 13-2-24.
//  Copyright (c) 2013年 ManGang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AFPageControl : UIView
{
    //属性
    NSInteger          _numberOfPages;
    NSInteger          _currentPage;
    
    //初始化
    CGSize             _imageSize;
    UIImage           *_highlightImage;
    UIImage           *_normalImage;
    
    //内部
    //当前的图片数组
    NSMutableArray    *_imageViewArray;
    
    //默认时5.0f，如果设置，请在numberOfPages之前改变
    CGFloat            _spaceBetween;
    
    //是不是星星评级显示
    BOOL               _isStarShow;
}
@property(nonatomic,readwrite,assign) NSInteger numberOfPages;
@property(nonatomic,readwrite,assign) NSInteger currentPage;
@property(nonatomic,readwrite,assign) CGFloat   spaceBetween;
@property(nonatomic,readwrite,assign) BOOL      isStarShow;  //Default is NO 
/**
 *初始化  大小 && 高亮图 && 正常图 && 图的大小
 *在初始化大小的顶部的中间显示
 */
- (id)initWithFrame:(CGRect)frame withHighlightImage:(UIImage*)highlightImage andNormalImage:(UIImage*)normalImage andImageSize:(CGSize)imageSize;
@end
