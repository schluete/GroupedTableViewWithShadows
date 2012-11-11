// UITableViewCell+CellShadows.h
// Created by Axel Schlueter on 11.11.12.
// Copyright (c) 2012 5vor9. All rights reserved.

#import <UIKit/UIKit.h>


@interface UITableViewCell (CellShadows)

/** adds a drop shadow to the background view of the (grouped) cell */
- (void)addShadowToCellInTableView:(UITableView *)tableView
                       atIndexPath:(NSIndexPath *)indexPath;

@end
