//
//  Factory.m
//  Pirates
//
//  Created by Orestis Lykouropoulos on 12/2/14.
//
//

#import "Factory.h"
#import "Tile.h"
#import <UIKit/UIKit.h>

@implementation Factory

-(NSArray *) tiles{
    
    
    Tile *tile1 = [[Tile alloc] init];
    tile1.story = @"Captain, we need a brave leader to undertake a voyage. You just stop the evil pirate Boss. Would you like a blunted sword to get you started?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    Weapon *bluntSword = [[Weapon alloc] init] ;
    bluntSword.name = @"Blunt Sword";
    bluntSword.damage = 12;
    tile1.weapon = bluntSword;
    tile1.actionButtonName = @"Pick up the sword";
    
    Tile *tile2 = [[Tile alloc] init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    Armor *steelArmor = [[Armor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 8;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take Armor";

    Tile *tile3 = [[Tile alloc] init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop and ask";
    
    NSMutableArray *column1 = [[NSMutableArray alloc] init];
    [column1 addObject:tile1];
    [column1 addObject:tile2];
    [column1 addObject:tile3];
    
    Tile *tile4 = [[Tile alloc] init];
    tile4.story = @"You have found a parrot. This can be used in your armor slot. Parrots are great defenders and fiercly loyal to their captain!";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    Armor *parrotArmor = [[Armor alloc] init];
    parrotArmor.health = 20;
    parrotArmor.name = @"Parrot";
    tile4.actionButtonName = @"Adopt Parrot";
    
    Tile *tile5 = [[Tile alloc] init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    Weapon *pistol = [[Weapon alloc] init];
    pistol.name = @"Pistol";
    pistol.damage = 17;
    tile5.actionButtonName = @"Take pistol";
    
    Tile *tile6 = [[Tile alloc] init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -22;
    tile6.actionButtonName = @"Show no fear";
    
    NSMutableArray *column2 = [[NSMutableArray alloc] init];
    [column2 addObject:tile4];
    [column2 addObject:tile5];
    [column2 addObject:tile6];
    
    Tile *tile7 = [[Tile alloc] init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervene?";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight them off";
    
    Tile *tile8 = [[Tile alloc] init];
    tile8.story = @"The legend of the deep. The mighty Kraken appears.";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -46;
    tile8.actionButtonName = @"Abandon Ship";
    
    Tile *tile9 = [[Tile alloc] init];
    tile9.story = @"You have stumbled upon a cave of pirate treasure.";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 20;
    tile9.actionButtonName = @"Take treasure";
    
    NSMutableArray *column3 = [[NSMutableArray alloc] init];
    [column3 addObject:tile7];
    [column3 addObject:tile8];
    [column3 addObject:tile9];
    
    Tile *tile10 = [[Tile alloc] init];
    tile10.story = @"A group of pirates attempts to board your ship.";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -15;
    tile10.actionButtonName = @"Repel the invaders";
    
    Tile *tile11 = [[Tile alloc] init];
    tile11.story = @"In the deep of the sea many things can be found. Will the fortune bring help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7;
    tile11.actionButtonName = @"Swim deeper";
    
    Tile *tile12= [[Tile alloc] init];
    tile12.story = @"Your final faceoff with the deadly Pirate Boss.";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight!";
    tile12.hasBoss = YES;
    
    NSMutableArray *column4 = [[NSMutableArray alloc] init];
    [column4 addObject:tile10];
    [column4 addObject:tile11];
    [column4 addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:column1, column2, column3, column4, nil];
   
    return tiles;
};

-(Character *)character{
    Character *character = [[Character alloc] init];
    character.health = 100;
    
    Armor *armor = [[Armor alloc] init];
    armor.name = @"Cloak";
    armor.health = 5;
    character.armor = armor;
    
    Weapon *weapon = [[Weapon alloc] init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;
    
    return character;
}

-(Boss *) boss{
    Boss *boss = [[Boss alloc] init];
    boss.health = 100;
    return boss;
}

@end
