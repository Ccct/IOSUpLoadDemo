//
//  ViewController.m
//  TheOrderUpload
//
//  Created by mac on 2019/10/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ViewController.h"


/// 上传的模型
@interface UploadModel : NSObject

@property (nonatomic,strong) NSArray * dataArray;

@property (nonatomic,copy) NSString *imgUrl;

@end

@implementation UploadModel

@end


@interface ViewController ()

@property (nonatomic,strong) NSArray<UIImage *> * selectImgs;

@property (nonatomic,strong) NSMutableArray<UploadModel *> * models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)upLoadMethond{
    
    dispatch_async(dispatch_queue_create("upimgs", DISPATCH_QUEUE_CONCURRENT), ^{
        
        __weak typeof(self) weakself = self;
        __block int finishNum = 0;
        for (int i = 0 ; i < self.selectImgs.count; i++) {
            
            NSDate *imgData = UIImagePNGRepresentation(self.selectImgs[i]);
            NSArray *array = @[imgData];
            
            //初始化上传模型
            UploadModel *model = [UploadModel new];
            model.dataArray = array;
            model.imgUrl = @"";
            
            [self.models addObject:model];
            
            /*******其实是一张一张传的，传数组是调用这个方法**********/
//            [YRHttpTool postWithURLNoAES:@"*****" params:@{} formDataArray:model.dataArray success:^(id json) {
//                finishNum ++ ;
//                model.imgUrl = json[@"response"][@"cloud"];
//                if (finishNum == self.selectImgs.count) {
//                    dispatch_async(dispatch_get_main_queue(), ^{
                        // 回到主线程进行UI操作
//                    });
//                }
//
//            } failure:^(NSError *error) {
//                dispatch_async(dispatch_get_main_queue(), ^{
//                      // 回到主线程进行UI操作
//
//                });
//            } progress:^(NSProgress *progress) {
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//
//                    float value = 1.0 *progress.completedUnitCount / progress.totalUnitCount;
//                    [MBProgressHUD showDownload:@"发布中..." toView:weakself.view progress:value];
//                }];
//            }];
        }
    });
}


@end
