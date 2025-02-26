#import "XXRootViewController.h"

@interface XXRootViewController ()
@property (nonatomic, strong) NSMutableArray *objects;
@end

@implementation XXRootViewController

- (void)loadView {
    [super loadView];
    
    _objects = [NSMutableArray array];
    
    // タイトルを削除
    self.title = nil; // これで "Root View Controller" のタイトルが削除されます
    
    // 編集ボタンを削除
    self.navigationItem.leftBarButtonItem = nil; // これで編集ボタンが削除されます
    
    // "+" ボタンを削除
    self.navigationItem.rightBarButtonItem = nil; // これで "+" ボタンが削除されます
}

- (void)addButtonTapped:(id)sender {
    // "+" ボタンが削除されたため、このメソッドはもはや使用されません
    [_objects insertObject:[NSDate date] atIndex:0];
    [self.tableView insertRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:0 inSection:0] ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSDate *date = _objects[indexPath.row];
    cell.textLabel.text = date.description;
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_objects removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
