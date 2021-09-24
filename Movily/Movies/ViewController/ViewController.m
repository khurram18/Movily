//
//  ViewController.m
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "ViewController.h"

#import "MoviesViewModel.h"
#import "MovieTableViewCell.h"

@import Networking;

@interface ViewController () {
  UISearchController* searchController;
  UITableView* tableView;
  UIActivityIndicatorView* activityIndicatorView;
  NSArray<MovieResponse*>* moviesArray;
}

@end

@interface ViewController (Private)
- (void)setupViews;
- (void)configureViews;
@end

@interface ViewController (TableViewDataSource) <UITableViewDataSource>
@end

@implementation ViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor whiteColor];
  [self setupViews];
}
- (void)viewDidLoad {
  [super viewDidLoad];
  [self configureViews];
  [self.viewModel search:@"machine"];
}

@end

@implementation ViewController (MoviesView)

- (void)showMovies:(NSArray<MovieResponse*>*)movies {
  moviesArray = movies;
  [tableView reloadData];
}
- (void)showLoading:(BOOL)loading {
  loading ? [activityIndicatorView startAnimating] : [activityIndicatorView stopAnimating];
}
- (void)showError:(NSString *)title message:(NSString *)message {
  UIAlertController* alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
  [alertController addAction:action];
  [self presentViewController:alertController animated:YES completion:nil];
}
@end

@implementation ViewController (TableViewDataSource)

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  MovieTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell.identifier forIndexPath:indexPath];
  cell.textLabel.text = moviesArray[indexPath.row].title;
  return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return moviesArray.count;
}
@end

@implementation ViewController (Private)

- (void)setupViews {
  searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
  
  activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
  
  tableView = [[UITableView alloc] init];
  tableView.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self.view addSubview:tableView];
  
  [NSLayoutConstraint activateConstraints:@[
    [tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
    [tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
    [tableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
    [tableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor]
  ]];
}

- (void)configureViews {
  activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleLarge;
  
  tableView.tableFooterView = activityIndicatorView;
  [tableView registerClass:[MovieTableViewCell class] forCellReuseIdentifier:MovieTableViewCell.identifier];
  tableView.dataSource = self;
}
@end
