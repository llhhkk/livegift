//
//  OXCPaintView.m
//  Touch learn
//
//  Created by LinHK on 2017/12/18.
//

#import "ViewController.h"
#import "OXCPaintView.h"
@interface ViewController ()
{
    UIImageView * imageV;
}
@property (strong, nonatomic) OXCPaintView *baibanV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的画板";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.baibanV];
    
    imageV = [UIImageView new];
    imageV.frame = CGRectMake(50, 300, self.view.frame.size.width-100, self.view.frame.size.height-300);
    imageV.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageV];
}
-(OXCPaintView *)baibanV{
    if(_baibanV==nil){
        _baibanV=[[OXCPaintView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        _baibanV.layer.borderColor = [UIColor redColor].CGColor;
        _baibanV.layer.borderWidth = 1;
        _baibanV.backgroundColor = [UIColor whiteColor];
    }
    return  _baibanV;
}

- (IBAction)clearAction:(id)sender {
    imageV.image = [self.baibanV clear];
}

@end
