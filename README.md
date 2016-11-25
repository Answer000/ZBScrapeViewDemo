# ZBScrapeView

### 框架作用
 * 实现图片擦除效果
 * 地址：[https://github.com/AnswerXu/ZBScrapeViewDemo.git](https://github.com/AnswerXu/ZBScrapeViewDemo.git)

### 效果图
![image](https://github.com/AnswerXu/ZBScrapeViewDemo/blob/master/ReadImage/scrape.gif)

### 使用方法
* 手动导入：将ZBScrapeView文件夹拖入项目后引入ZBScrapeView.h头文件即可
* pods导入：
```
  pod 'ZBScrapeView', '~> 0.0.1'
```
 
* 代码创建
```Objc
    ZBScrapeView *view0 = [[ZBScrapeView alloc] initWithFrame:self.view.bounds ];
    view0.topImage = [UIImage imageNamed:@"2A"];
    view0.bottomImage = [UIImage imageNamed:@"2B"];
    [self.view addSubview:view0];
```

* xib创建
```Objc
    //self.view继承ZBScrapeView后
    ZBScrapeView *view = (ZBScrapeView *)self.view;
    view.topImage = [UIImage imageNamed:@"2A.jpg"];
    view.bottomImage = [UIImage imageNamed:@"2B.jpg"];
```

### 

	   谢谢支持，可能还有很多不完善的地方，期待您的建议！如对您有帮助，请不吝您的Star，您的支持与鼓励是我继续前行的动力。
	   邮箱：zhengbo073017@163.com
