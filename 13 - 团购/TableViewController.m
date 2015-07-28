//
//  TableViewController.m
//  13 - 团购
//
//  Created by 肖晨 on 15/7/17.
//  Copyright (c) 2015年 肖晨. All rights reserved.
//

#import "TableViewController.h"
#import "TgCell.h"
#import "Tg.h"
#import "TgFooterView.h"
@interface TableViewController ()<TgFooterViewDelegate>
@property (strong, nonatomic)NSMutableArray *dataList;

@end

@implementation TableViewController

- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [Tg tgs];
    }
    return _dataList;
}

#if 1
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    TgFooterView *foot = [TgFooterView footerView];
    foot.delegate = self;
    self.tableView.tableFooterView = foot;
    
    UIView *header = [[[NSBundle mainBundle] loadNibNamed:@"TgHeaderView" owner:nil options:nil] lastObject];
    self.tableView.tableHeaderView = header;
}
#endif

#pragma mark - TgFooterViewDelegate
- (void)tgFooterViewDidClickDownloadButton:(TgFooterView *)footerView
{
    // 加载数据
    NSLog(@"努力加载数据中");
    NSLog(@"%lu",(unsigned long)self.dataList.count);
   
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 向数组中添加数据，模拟网络加载完成之后的效果
        NSDictionary *dict = @{@"title":@"哈哈", @"price":@"2100", @"buyCount":@"1000", @"icon":@"ad_00"};
        Tg *data = [Tg tgWithDict:dict];
        [self.dataList addObject:data];
        
        // 刷新数据
        //    [self.tableView reloadData];
        // 新建一个indexPath
        NSIndexPath *index = [NSIndexPath indexPathForRow:(self.dataList.count - 1) inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationAutomatic];
        
        [footerView endRefresh];
    });
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TgCell *cell = [TgCell cellWithTableView:tableView];
    cell.tg = self.dataList[indexPath.row];
    return cell;

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
