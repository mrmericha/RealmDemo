//
//  TableViewController.m
//  RealmDemo
//
//  Created by Patrick Adams on 11/18/14.
//  Copyright (c) 2014 Patrick Adams. All rights reserved.
//

#import "TableViewController.h"
#import "VideoGame.h"
#import "VideoGameCell.h"

@interface TableViewController ()

@property (nonatomic, strong) NSArray *videoGameArray;
@property (nonatomic, strong) RLMRealm *realm;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.videoGameArray = @[@{@"name" : @"Monument Valley", @"platform" : @"iOS", @"genre" : @"Puzzle"}, @{@"name" : @"Space Age", @"platform" : @"iOS", @"genre" : @"Adventure"}, @{@"name" : @"Far Cry 4", @"platform" : @"PS4", @"genre" : @"Shooter"}, @{@"name" : @"Sunset Overdrive", @"platform" : @"Xbox One", @"genre" : @"Action"}, @{@"name" : @"Borderlands: The Pre-Sequel", @"platform" : @"PC", @"genre" : @"Shooter"}];
    
    //Get the default Realm, you only need to do this once per thread
    self.realm = [RLMRealm defaultRealm];
    
    [self.realm beginWriteTransaction];
    
    [self.realm deleteAllObjects];
    
    //Create objects
    for (VideoGame *videoGame in self.videoGameArray)
    {
        VideoGame *newVideoGame = [[VideoGame alloc] init];
        newVideoGame.name = [videoGame valueForKey:@"name"];
        newVideoGame.platform = [videoGame valueForKey:@"platform"];
        newVideoGame.genre = [videoGame valueForKey:@"genre"];
        [self.realm addObject:newVideoGame];
    }
    
    [self.realm commitWriteTransaction];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.videoGameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoGameCell *gameCell = [tableView dequeueReusableCellWithIdentifier:@"GameCell" forIndexPath:indexPath];
    
    RLMResults *videoGames = [VideoGame allObjects];
    VideoGame *videoGame = videoGames[indexPath.row];
    gameCell.nameLabel.text = videoGame.name;
    gameCell.platformLabel.text = [NSString stringWithFormat:@"(%@)", videoGame.platform];
    
    return gameCell;
}


@end
