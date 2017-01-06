//
//  MyInfoLoginVC.m
//  GaoHeng
//
//  Created by heyudongfang on 16/1/6.
//  Copyright © 2016年 heyudongfang. All rights reserved.
//

#import "MyInfoLoginVC.h"
#import "MyInfoRegisterVC.h"
@interface MyInfoLoginVC ()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *photoTextField; //手机
@property (nonatomic,strong)UITextField *psdTextField; //密码
@end

@implementation MyInfoLoginVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createLoginUI];
    [self back];
    
}
-(void)stopKeyBoard:(UIView *)view
{
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
    tapGestureRecognizer.cancelsTouchesInView = NO;
    //将触摸事件添加到当前view
    [view addGestureRecognizer:tapGestureRecognizer];
    
}

-(void)keyboardHide:(UITapGestureRecognizer*)tap{
    DoLog(@"d 00");
    [self.photoTextField resignFirstResponder];
    [ _psdTextField resignFirstResponder];
}
-(void)createLoginUI
{
    //触摸键盘消失
    [self stopKeyBoard:self.view];
    
    CGFloat gap = 20;
    CGFloat heightgap = 44;
    CGFloat topGap = 15;
    //背景图片
    UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,  0, MainScreenWidth, MainScreenHeight)];
    bgImage.image = [UIImage imageNamed:@"Login_images"];
    [self.view addSubview:bgImage];
    bgImage.userInteractionEnabled = YES;
    
    //logo
    
    UIImageView *logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(MainScreenWidth/2-40, 64+26,83, 83)];
    logoImage.layer.cornerRadius = 83/2;
    logoImage.layer.masksToBounds = YES;
    logoImage.image = [UIImage imageNamed:@"Login_logo"];
    //logoImage.backgroundColor = [ UIColor redColor];
    [bgImage addSubview:logoImage];
    
    
    
    
    
    //
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(gap, MainScreenHeight/2-heightgap, MainScreenWidth- gap *2, heightgap*2)];
    grayView.backgroundColor = [UIColor blackColor];
    grayView.alpha = alphaNum;
    grayView.layer.cornerRadius =3;
    grayView.layer.masksToBounds =YES;
    [bgImage addSubview:grayView];
    
    UIView *grayView1 = [[UIView alloc] initWithFrame:CGRectMake(gap, MainScreenHeight/2-heightgap, MainScreenWidth- gap *2, heightgap*2)];
    [bgImage addSubview:grayView1];
    //
    UIImageView *leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(topGap, heightgap/2-11,17 , 22)];
    leftImageView.image = [UIImage imageNamed:@"Login_phone"];
    
    self.photoTextField = [UITextField textFielWithFrame:CGRectMake(CGRectGetMaxX(leftImageView.frame)+topGap, topGap, CGRectGetWidth(grayView.frame)-CGRectGetMaxX(leftImageView.frame)-topGap*2, 20) leftImageView:nil titleOfPlaceholder:@"手机" font:font14 textColor:[UIColor whiteColor] borderColor:[UIColor whiteColor] borderWidth:0];
    self.photoTextField.delegate = self;
    UIColor *color = CustomerColor(162, 162, 162);
    _photoTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机" attributes:@{NSForegroundColorAttributeName: color}];
    _photoTextField.clearButtonMode=UITextFieldViewModeAlways;
//     DoLog(@"getUserPhone:%@",[Tools getUserPhone] );
//    if ([Tools getUserPhone] != nil) {
//        _photoTextField.text = [Tools getUserPhone];
//    }
    [ grayView1 addSubview:leftImageView];
    [grayView1 addSubview:self.photoTextField];
    
    UILabel *line1 = [UILabel lableWithFrame:CGRectMake(gap , heightgap -1, CGRectGetWidth(grayView1.frame)-gap, 1) title:@"" textFont:14.0 textColor:[UIColor clearColor]];
    line1.layer.borderWidth = 1;
    line1.layer.borderColor = lineC.CGColor;
    line1.alpha = 0.5;
    [ grayView1 addSubview:line1];
    
    //密码
    UIImageView *leftImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(topGap,heightgap + heightgap/2-11,17 , 22)];
    leftImageView1.image = [UIImage imageNamed:@"Login_lock"];
    
    _psdTextField = [UITextField textFielWithFrame:CGRectMake(CGRectGetMaxX(leftImageView1.frame)+topGap,heightgap+ topGap, CGRectGetWidth(grayView.frame)-CGRectGetMaxX(leftImageView1.frame)-topGap*2, 20) leftImageView:nil titleOfPlaceholder:@"密码" font:font14 textColor:[UIColor whiteColor] borderColor:[UIColor whiteColor] borderWidth:0];
    _psdTextField.clearButtonMode=UITextFieldViewModeAlways;
    _psdTextField.delegate = self;
    _psdTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: color}];
    _psdTextField.secureTextEntry = YES;
    [ grayView1 addSubview:leftImageView1];
    [grayView1 addSubview: _psdTextField];
    
    
    //忘记密码
    UIButton *fogotButton = [ UIButton buttonWithFrame:CGRectMake(CGRectGetMaxX(grayView1.frame)-100, CGRectGetMaxY(grayView1.frame)+gap/4, 100, 20) title:@"忘记密码?" backgroundColor:[UIColor clearColor] type:UIButtonTypeCustom target:self action:@selector(forgotButtonAction:)];
    [fogotButton setTitleColor:CustomerColor(162,162, 162) forState:UIControlStateNormal];
    fogotButton.titleLabel.font = [UIFont systemFontOfSize:font14];
    fogotButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [bgImage addSubview:fogotButton];
    //登陆
    
    UIButton  *submitButton = [UIButton buttonWithFrame:CGRectMake(gap,CGRectGetMaxY(grayView1.frame)+heightgap *1.5, MainScreenWidth- gap*2, heightgap) title:@"登录" backgroundColor:CustomerColor(255,110,46) type:UIButtonTypeCustom target:self action:@selector(submitButton)];
    submitButton.layer.cornerRadius = 5;
    submitButton.layer.masksToBounds =YES;
    submitButton.layer.borderWidth =1;
    submitButton.layer.borderColor =[UIColor grayColor].CGColor;
    [bgImage addSubview:submitButton];
    [submitButton  setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    // 注册
    
    UILabel *line1_1 =[UILabel lableWithFrame:CGRectMake(gap+gap,CGRectGetMaxY(submitButton.frame)+ heightgap, MainScreenWidth/2-gap*4, 1) title:@"" textFont:14 textColor:[UIColor whiteColor]];
    line1_1.layer.borderWidth = 1;
    line1_1.layer.borderColor = [UIColor orangeColor].CGColor;
    line1_1.alpha = 0.5;
    [bgImage addSubview:line1_1];
    
    //
    UIButton *registerButton = [ UIButton buttonWithFrame:CGRectMake(CGRectGetMaxX(line1_1.frame),CGRectGetMaxY(submitButton.frame)+ heightgap-10, gap*4, 20) title:@"立即注册" backgroundColor:[UIColor clearColor] type:UIButtonTypeCustom target:self action:@selector(registerButtonAction:)];
    // registerButton.backgroundColor = [UIColor cyanColor];
    [registerButton setTitleColor:CustomerColor(162,162, 162) forState:UIControlStateNormal];
    registerButton.titleLabel.font = [UIFont systemFontOfSize:font14];
    //registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [bgImage addSubview:registerButton];
    
    UILabel *line1_2 =[UILabel lableWithFrame:CGRectMake(MainScreenWidth/2 +gap*2,CGRectGetMaxY(submitButton.frame)+ heightgap, MainScreenWidth/2-gap*4, 1) title:@"" textFont:14 textColor:[UIColor whiteColor]];
    line1_2.layer.borderWidth = 1;
    line1_2.layer.borderColor = [UIColor orangeColor].CGColor;
    line1_2.alpha = 0.5;
    [bgImage addSubview:line1_2];
}
-(void)registerButtonAction:(UIButton *)sender
{    //  [AlertShow alertShowWithContent:@"立即注册" Seconds:0.7f];
    [self.navigationController pushViewController: [[MyInfoRegisterVC alloc] init] animated:YES];
}
#pragma mark 忘记密码
-(void)forgotButtonAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[[MyInfoForgetVC alloc] init]animated:YES];
}
#pragma mark 登录
- (void)submitButton {
    
    if ([_photoTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"用户名不能为空"];
    }else if ([_psdTextField.text isEqualToString:@""])
    {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
    }else{
        // [AlertShow alertShowWithContent:@"登录" Seconds:0.7f];
        [Tools g_setupProgressHud:self];
        [Tools getUserLogin:self.photoTextField.text Password:_psdTextField.text type:G_POST passValue:^(NSMutableArray *array) {
            [Tools.hud hide: YES];
            for (NSDictionary *dic in array) {
                DoLog(@"status:%@", dic[@"status"]);
                if ([dic[@"status" ] isEqualToString:@"1"]) {
                    
                    [SVProgressHUD showErrorWithStatus:dic[@"message" ]];
                }   else {
                    
                    [SVProgressHUD showSuccessWithStatus: dic[@"message" ]];
                    //
                    [Tools resetLoginCode:dic[@"status"]];
                    //
                    [ Tools resetUserId:dic[@"memberId"]];
                    if ([dic[@"imgpath"]isEqualToString:@""]) {
                        
                        [Tools resetImage:[UIImage imageNamed:@"Myinfo_photo"]];
                        UserLoginModel *model = [[UserLoginModel alloc] init];
                        [model setValuesForKeysWithDictionary:dic];
                        [Tools setUserLogin:model];
                        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
                        [notificationCenter postNotificationName:@"userLoginImage" object:nil];
                        
                        [self dismissViewControllerAnimated:YES completion:nil];
                        
                        
                    }else
                    {
                    UIImageView *imagepath = [[UIImageView alloc] init];
                        DoLog(@"登陆图片地址:%@",G_ImageUrl(dic[@"imgpath"]));
                    [ imagepath sd_setImageWithURL:[NSURL URLWithString:G_ImageUrl(dic[@"imgpath"]) ] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                        DoLog(@"11");
                        [imagepath sd_setImageWithURL:[NSURL URLWithString:G_ImageUrl(dic[@"imgpath"]) ]    ];
                        
                          //保存图片
                        if (image == NULL) {
                            DoLog(@"1");
                            [Tools resetImage:[UIImage imageNamed:@"Myinfo_photo"] ];
                        }else{
                             DoLog(@"2");
                        [Tools resetImage:image];
                        }
                        UserLoginModel *model = [[UserLoginModel alloc] init];
                        [model setValuesForKeysWithDictionary:dic];
                        [Tools setUserLogin:model];
                        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
                        [notificationCenter postNotificationName:@"userLoginImage" object:nil];
                                               [notificationCenter postNotificationName:@"yestologin" object:nil];

                        [self dismissViewControllerAnimated:YES completion:nil];
                        
                        
                    } ];
                    }
                }
            }
            
            
            
        } error:^(NSString *error) {
            [Tools.hud hide:YES];
            [SVProgressHUD showErrorWithStatus:error];
        }];
        
    }
}

-(void)back
{
   UIButton * backButton = [UIButton buttonWithFrame:CGRectMake(20, 30, 20, 20) title:@"" backgroundColor:[UIColor clearColor] type:UIButtonTypeCustom target:self action:@selector(backButton)];
    [backButton setImage:[UIImage imageNamed:@"GX_back"] forState:UIControlStateNormal];
    [self.view addSubview:backButton];
}

-(void)backButton
{
    self.tabBarController.tabBar.hidden = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"noti" object:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
