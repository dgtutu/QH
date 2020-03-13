//
//  ViewController.m
//  QH
//
//  Created by Ben on 2020/3/13.
//  Copyright © 2020 Ben. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) NSArray *standImages;
@property (strong,nonatomic) NSArray *xiaozhaoImage;
@property (strong,nonatomic) NSArray *dazhaoImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.frame=CGRectMake(0, 0,
                                300,
                                400);
    self.imageView.contentMode=UIViewContentModeCenter;
    self.imageView.image =
    [UIImage imageNamed:@"dazhao_1"];
    
    //Zhanli
    self.standImages=[self loadAllImageWithimagePrefix:@"stand" count:10];

    self.xiaozhaoImage=[self loadAllImageWithimagePrefix:@"xiaozhao3" count:39];
    
    self.dazhaoImage=[self loadAllImageWithimagePrefix:@"dazhao" count:87];

    [self zhanli];
}
//
-(NSArray *)loadAllImageWithimagePrefix:(NSString *)imagePrefix count:(int)count{
    NSMutableArray<UIImage *> *images=[NSMutableArray array];
    for(int i=0; i<count; i++){
        //获取所有图片的p名称
        NSString *imageName=[NSString stringWithFormat:@"%@_%d",imagePrefix,i+1];
        //创建uUIiImage
        UIImage *image=[UIImage imageNamed:imageName];
        //装入数组
        [images addObject:image];
    }
    return images;
}


- (IBAction)zhanli {
   [self playZhaoWithImageArray:self.standImages];
}

- (IBAction)xiaozhao {
    
     [self playZhaoWithImageArray:self.xiaozhaoImage];
}

- (IBAction)dazhao {
    
    [self playZhaoWithImageArray:self.dazhaoImage];
}

-(void)playZhaoWithImageArray:(NSArray *)ImageArray{
    
     //设置动画图片
     self.imageView.animationImages=ImageArray;
     //设置播放的次数
     self.imageView.animationRepeatCount=0;
     //设置播放的时长
    self.imageView.animationDuration=0.5;
     [self.imageView startAnimating];
    //[self performSelector:@selector(zhanli)
            //   withObject:nil
             //  afterDelay:self.imageView.animationDuration];
}
@end
