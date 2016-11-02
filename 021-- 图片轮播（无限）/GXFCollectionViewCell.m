//
//  GXFCollectionViewCell.m
//  021-- 图片轮播（无限）
//
//  Created by mac on 16/10/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GXFCollectionViewCell.h"

@implementation GXFCollectionViewCell {
    
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // 创建图片框
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = self.bounds;
        [self addSubview:_imageView];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image {
    
    _image = image;
    _imageView.image = image;
}

@end
