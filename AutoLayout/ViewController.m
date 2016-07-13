//
//  ViewController.m
//  AutoLayout
//
//  Created by zluof on 16/7/6.
//  Copyright © 2016年 zluof. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/** 
 * 注意点：（1）不能先通过Frame 或者 bounds 来设置 控件的大小位置，否则再使用Autolayout就无效了 （2）使用Autolayout 之前，一定要把系统自带的自适应约束去掉，也就是UIView的这个属性translatesAutoresizingMaskIntoConstraints这个属性是默认为YES，实现自动布局时该属性需设置为NO
 * Autolayout 自动布局 使用 NSLayoutConstraint 这个类
 * 系统提供里两个类方法 分别返回 一个 NSLayoutConstraint对象的NSArray 和 NSLayoutConstraint 对象
 * 利用这两个方法实现自动布局
 */



- (void)viewDidLoad {
    [super viewDidLoad];
  
    //创建一个View
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:greenView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
   
   /*
    第二种方法，返回一个数组，
    VLF(VisualFormat language)抽象语言 叫可视化格式语言
    */



    CGFloat margin = 20;
    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[greenView]-margin-|" options:kNilOptions metrics:@{@"margin":@(margin)} views:@{@"greenView":greenView}];
    [self.view addConstraints:constraintH];
    
    NSArray *constraintH2 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-margin-[blueView]-margin-|" options:kNilOptions metrics:@{@"margin":@(margin)} views:@{@"blueView":blueView}];
    [self.view addConstraints:constraintH2];
    
    NSNumber *width = @(self.view.frame.size.height/2);
    NSArray *constraintV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[greenView(100)]-margin-[blueView(100)]" options:kNilOptions metrics:@{@"margin":@(margin),@"width":width} views:@{@"greenView":greenView,@"blueView":blueView}];
    [self.view addConstraints:constraintV];
    
    
    
//    [self zlfTest1];

}

/**
 * 自动布局1 NSLayoutConstraint 对象
 */
-(void)zlfTest1{
    
    //创建一个View
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:greenView];
    
    
    /**
     * 返回 NSLayoutConstraint 实现自动布局
     * @param  view1     需要布局的view
     * @param  attri1    需要布局View的属性
     * @param  view2     需要布局View 的父视图
     * @param  attri2    需要布局View 的父视图的属性
     * @param  multiplier 约束比例
     * @param  c          约束常量
     *
     * 一个NSLayoutConstraint对象 其实就是在Xib里的一条约束的先线
     */
    
    //这个方法可以用一句话来说： 拿下面的约束X来说哈：greenView的属性-->左边 等于 self.view的属性--> 左边的一倍加上20
    
    
    //1.约束宽度
    NSLayoutConstraint *consranintWidth = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:100];
    [greenView addConstraint:consranintWidth];
    //2.约束高度
    NSLayoutConstraint *consranintHeight = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:NSLayoutAttributeNotAnAttribute attribute:NSLayoutAttributeHeight multiplier:0 constant:100];
    [greenView addConstraint:consranintHeight];
    
    //3.约束X
    NSLayoutConstraint *consrtranintX = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20];
    [self.view addConstraint:consrtranintX];
    //4.约束Y
    NSLayoutConstraint *consrtranintY = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:consrtranintY];
}

/**
 
 *typedef NS_ENUM(NSInteger, NSLayoutAttribute) {
 NSLayoutAttributeLeft = 1, ----------->距左
 NSLayoutAttributeRight,    ----------->距右
 NSLayoutAttributeTop,       ----------->距顶部
 NSLayoutAttributeBottom,    ----------->距底部
 NSLayoutAttributeLeading,
 NSLayoutAttributeTrailing,
 NSLayoutAttributeWidth,      ----------->宽度
 NSLayoutAttributeHeight,      ----------->高度
 NSLayoutAttributeCenterX,     ----------->中心点X
 NSLayoutAttributeCenterY,     ----------->中心点Y
 NSLayoutAttributeBaseline,     ----------->基准线
 NSLayoutAttributeLastBaseline = NSLayoutAttributeBaseline, ----------->最后的基准线
 NSLayoutAttributeFirstBaseline ----------->第一基准线
 
下面的和上面的差不多
 
 NSLayoutAttributeLeftMargin
 NSLayoutAttributeRightMargi
 NSLayoutAttributeTopMargin
 NSLayoutAttributeBottomMargin
 NSLayoutAttributeLeadingMargin
 NSLayoutAttributeTrailingMargin
 NSLayoutAttributeCenterXWithinMargins
 NSLayoutAttributeCenterYWithinMargins
 
 NSLayoutAttributeNotAnAttribute = 0
 
 
 
 
 NSLayoutAttributeLeft 和 NSLayoutAttributeRight 代表从左右进行布局
 NSLayoutAttributeLeading和 NSLayoutAttributeTrailing 代表从前后进行布局
 
 NSLayoutAttributeLeft 和 NSLayoutAttributeLeading 是一个效果的，布局习惯从左到右
 但在有些国家地区，NSLayoutAttributeRight和NSLayoutAttributeLeading 是一个效果，布局习惯从右往左
 使用推荐：NSLayoutAttributeLeading和 NSLayoutAttributeTrailing（比较常用）
 
 */
@end
