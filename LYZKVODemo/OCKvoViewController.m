//
//  OCKvoViewController.m
//  LYZKVODemo
//
//  Created by 刘耀宗 on 2021/6/20.
//

#import "OCKvoViewController.h"
#import "KVOModel.h"
@interface OCKvoViewController ()
@property (nonatomic, strong) KVOModel *model;
@end

@implementation OCKvoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
    self.model = [KVOModel new];
    //添加观察者
    [self.model addObserver:self forKeyPath:@"name" options: NSKeyValueObservingOptionNew context:nil];
//    self.model.name = @"adsf ";
    NSLog(@"name = %@",self.model.name);
    //手动触发
//    [self.model willChangeValueForKey:@"name"];
//    [self.model didChangeValueForKey:@"name"];
//    
    
}

//回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"name"]) {
        NSLog(@"change = %@",change);
    }
    NSLog(@"监听到了 OC");
}

//销毁的时候一定要移除
-(void)dealloc
{
    [self.model removeObserver:self forKeyPath:@"name"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
