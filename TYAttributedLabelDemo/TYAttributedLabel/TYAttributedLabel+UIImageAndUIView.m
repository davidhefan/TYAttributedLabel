//
//  TYAttributedLabel+ImageAndView.m
//  TYAttributedLabelDemo
//
//  Created by tanyang on 15/4/11.
//  Copyright (c) 2015年 tanyang. All rights reserved.
//

#import "TYAttributedLabel.h"
#import "TYDrawImageStorage.h"
#import "TYDrawViewStorage.h"

@implementation TYAttributedLabel (UIImageAndUIView)

- (void)addImageWithContent:(id)imageContent range:(NSRange)range size:(CGSize)size alignment:(TYDrawAlignment)alignment
{
    TYDrawImageStorage *imageRun = [[TYDrawImageStorage alloc]init];
    imageRun.imageContent = imageContent;
    imageRun.drawAlignment = alignment;
    imageRun.range = range;
    imageRun.size = size;
    [self addTextStorage:imageRun];
}

- (void)addImageWithContent:(id)imageContent range:(NSRange)range size:(CGSize)size
{
    [self addImageWithContent:imageContent range:range size:size alignment:TYDrawAlignmentTop];
}

- (void)addImageWithContent:(id)imageContent range:(NSRange)range
{
    
    if ([imageContent isKindOfClass:[UIImage class]]) {
        [self addImageWithContent:imageContent range:range size:((UIImage *)imageContent).size];
    } else {
        [self addImageWithContent:imageContent range:range size:CGSizeMake(self.font.pointSize, self.font.ascender)];
    }
}

- (void)addView:(UIView *)view range:(NSRange)range alignment:(TYDrawAlignment)alignment
{
    TYDrawViewStorage *viewRun = [[TYDrawViewStorage alloc]init];
    viewRun.drawAlignment = alignment;
    viewRun.view = view;
    viewRun.range = range;
    
    [self addTextStorage:viewRun];
}

- (void)addView:(UIView *)view range:(NSRange)range
{
    [self addView:view range:range alignment:TYDrawAlignmentTop];
}

- (void)appendImageWithContent:(id)imageContent size:(CGSize)size alignment:(TYDrawAlignment)alignment
{
    TYDrawImageStorage *imageRun = [[TYDrawImageStorage alloc]init];
    imageRun.drawAlignment = alignment;
    imageRun.imageContent = imageContent;
    imageRun.size = size;
    
    [self appendTextStorage:imageRun];
}

- (void)appendImageWithContent:(id)imageContent size:(CGSize)size
{
    [self appendImageWithContent:imageContent size:size alignment:TYDrawAlignmentTop];
}

- (void)appendImageWithContent:(id)imageContent
{
    if ([imageContent isKindOfClass:[UIImage class]]) {
        [self appendImageWithContent:imageContent size:((UIImage *)imageContent).size];
    } else {
        [self appendImageWithContent:imageContent size:CGSizeMake(self.font.pointSize, self.font.ascender)];
    }
    
}

- (void)appendView:(UIView *)view alignment:(TYDrawAlignment)alignment
{
    TYDrawViewStorage *viewRun = [[TYDrawViewStorage alloc]init];
    viewRun.drawAlignment = alignment;
    viewRun.view = view;
    
    [self appendTextStorage:viewRun];
}

- (void)appendView:(UIView *)view
{
    [self appendView:view alignment:TYDrawAlignmentTop];
}


@end
