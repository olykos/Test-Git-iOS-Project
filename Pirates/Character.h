//
//  Character.h
//  Pirates
//
//  Created by Orestis Lykouropoulos on 12/3/14.
//
//

#import <Foundation/Foundation.h>
#import "Armor.h"
#import "Weapon.h"

@interface Character : NSObject

@property (strong, nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armor *armor;
@property (nonatomic) int health;
@property (nonatomic) int damage;

@end
