//
//  ViewController.m
//  Pirates
//
//  Created by Orestis Lykouropoulos on 12/2/14.
//
//

#import "ViewController.h"
#import "Factory.h"
#import "Tile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Factory *factory = [[Factory alloc] init];
    self.tiles = factory.tiles;
    self.character = factory.character;
    self.boss = factory.boss;
    self.currentPoint = CGPointMake(0, 0); //initial point
    [self updateCharacterStats:nil withWeapon:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark helper methods

- (void)updateTile {
    Tile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tile.story;
    self.backgroundImage.image = tile.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle: tile.actionButtonName forState:UIControlStateNormal];
}

- (void)updateButtons {
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

- (void)updateCharacterStats:(Armor *) armor withWeapon:(Weapon *) weapon withHealthEffect:(int)healthEffect{
    if (armor != nil){
        
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
        
    }
    
    else if (weapon != nil){
        
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
        
    }
    
    else if (healthEffect != 0){
        
        self.character.health = self.character.health + healthEffect;
    }
    
    else { //for initial setup
        
        self.character.health = self.character.health + self.character.armor.health;
                self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

-(BOOL)tileExistsAtPoint:(CGPoint)point{
    //check if valid tile
    if(point.y >= 0 && point.x >=0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    }
    else{
        return YES;
    }
}

#pragma mark - IBAction

- (IBAction)northButtonPressed:(id)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)southButtonPressed:(id)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)westButtonPressed:(id)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)eastButtonPressed:(id)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)resetButtonPressed:(id)sender {
    
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
    
}

- (IBAction)actionButtonPressed:(id)sender {
    
    Tile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if (tile.hasBoss){
        NSLog(@"Encountered Boss");
        NSLog(@"%i", self.boss.health);
        self.boss.health -= self.character.damage;
        NSLog(@"%i", self.boss.health);

    }
    [self updateCharacterStats:tile.armor withWeapon:tile.weapon withHealthEffect:tile.healthEffect];
    
    if (self.character.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You just died. Restart the game." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if (self.boss.health <= 0){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have defeated the evil Pirate Boss!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
    [self updateTile];
}
@end
