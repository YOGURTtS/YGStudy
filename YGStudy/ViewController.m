//
//  ViewController.m
//  YGStudy
//
//  Created by 孙星 on 2019/9/2.
//  Copyright © 2019 YOGURTS. All rights reserved.
//

#import "ViewController.h"
#import "YGMessageForwardViewController.h"

@implementation YGClassModel



@end

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray<YGClassModel *> *dataSource;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"YGStudy";
    
    [self configDataSource];
    
    [self.view addSubview:self.tableView];
}

- (void)configDataSource {
    YGClassModel *model1 = [YGClassModel new];
    model1.title = @"方法转发";
    model1.clazz = [YGMessageForwardViewController class];
    
    
    self.dataSource = @[
                        model1,
                        ];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

#pragma mark - UITableViewDataSource
#pragma mark -


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    YGClassModel *model = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate
#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    YGClassModel *model = [self.dataSource objectAtIndex:indexPath.row];
    __strong UIViewController *object = [model.clazz new];
    object.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:object animated:YES];
}




#pragma mark - lazy load

- (NSArray<YGClassModel *> *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSArray array];
    }
    return _dataSource;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}



@end
