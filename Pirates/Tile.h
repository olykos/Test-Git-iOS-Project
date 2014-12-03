//
//  Tile.h
//  Pirates
//
//  Created by Orestis Lykouropoulos on 12/2/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Weapon.h"
#import "Armor.h"


@interface Tile : NSObject

@property (strong,nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armor *armor;
@property (nonatomic) int healthEffect;
@property (nonatomic) BOOL hasBoss;


@end
