// FNShadowTableController.m
// Created by Axel Schlueter on 11.11.12.
// Copyright (c) 2012 5vor9. All rights reserved.

#import "FNShadowTableController.h"
#import "UITableViewCell+CellShadows.h"


@implementation FNShadowTableController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"MainCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
  [cell addShadowToCellInTableView:tableView atIndexPath:indexPath];
  return cell;
}

@end
