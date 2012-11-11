// UITableViewCell+CellShadows.m
// Created by Axel Schlueter on 11.11.12.
// Copyright (c) 2012 5vor9. All rights reserved.

#import "UITableViewCell+CellShadows.h"
#import <QuartzCore/QuartzCore.h>


@implementation UITableViewCell (CellShadows)

/** adds a drop shadow to the background view of the (grouped) cell */
- (void)addShadowToCellInTableView:(UITableView *)tableView
                       atIndexPath:(NSIndexPath *)indexPath
{
  BOOL isFirstRow = !indexPath.row;
  BOOL isLastRow = (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1);
  
  // the shadow rect determines the area in which the shadow gets drawn
  CGRect shadowRect = CGRectInset(self.backgroundView.bounds, 0, -10);
  if(isFirstRow)
    shadowRect.origin.y += 10;
  else if(isLastRow)
    shadowRect.size.height -= 10;
  
  // the mask rect ensures that the shadow doesn't bleed into other table cells
  CGRect maskRect = CGRectInset(self.backgroundView.bounds, -20, 0);
  if(isFirstRow) {
    maskRect.origin.y -= 10;
    maskRect.size.height += 10;
  }
  else if(isLastRow)
    maskRect.size.height += 10;
  
  // now configure the background view layer with the shadow
  CALayer *layer = self.backgroundView.layer;
  layer.shadowColor = [UIColor redColor].CGColor;
  layer.shadowOffset = CGSizeMake(0, 0);
  layer.shadowRadius = 3;
  layer.shadowOpacity = 0.75;
  layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:shadowRect cornerRadius:5].CGPath;
  layer.masksToBounds = NO;
  
  // and finally add the shadow mask
  CAShapeLayer *maskLayer = [CAShapeLayer layer];
  maskLayer.path = [UIBezierPath bezierPathWithRect:maskRect].CGPath;
  layer.mask = maskLayer;
}

@end
