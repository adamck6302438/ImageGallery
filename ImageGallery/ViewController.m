//
//  ViewController.m
//  ImageGallery
//
//  Created by Frances ZiyiFan on 5/13/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) UIImage* currentImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int numberOfImage = 4;
    for(int i =1; i < numberOfImage; i++){
        NSString *imageName = [NSString stringWithFormat:@"Lighthouse%d", i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(self.scrollView.frame.size.width*(i-1), 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
        [imageView addGestureRecognizer:tap];
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(numberOfImage*_scrollView.frame.size.width, 0);
    self.scrollView.pagingEnabled = YES;
    
}

-(void) viewTapped: (UITapGestureRecognizer *)sender{
    NSLog(@"tapped");
    UIImageView* imageView = (UIImageView*)sender.view;
    UIImage* imageOfImageView = imageView.image;
    self.currentImage = imageOfImageView;
    if(sender.state == UIGestureRecognizerStateEnded){
        [self performSegueWithIdentifier:@"show detail" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString: @"show detail"]){
        ImageDetailViewController *dvc = segue.destinationViewController;
        dvc.image = self.currentImage;
    }
}


@end
