//
//  ImageDetailViewController.m
//  ImageGallery
//
//  Created by Frances ZiyiFan on 5/13/19.
//  Copyright © 2019 Ray Kang. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.scrollView sizeToFit];
    self.imageView = [[UIImageView alloc] initWithImage: self.image];
    [self.scrollView addSubview:self.imageView];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.imageView sizeToFit];
    self.imageView.center = CGPointMake(self.scrollView.center.x, self.scrollView.center.y);
//    [self.imageView.centerXAnchor constraintEqualToAnchor: self.scrollView.topAnchor].active = YES;
//    [self.imageView.centerYAnchor constraintEqualToAnchor: self.scrollView.bottomAnchor].active = YES;
//    [self.imageView.leadingAnchor constraintEqualToAnchor: self.scrollView.leadingAnchor].active = YES;
//    [self.imageView.trailingAnchor constraintEqualToAnchor: self.scrollView.trailingAnchor].active = YES;
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.zoomScale = 0.4;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) setupGestureRecognizer{
    UIPinchGestureRecognizer *recog = [[UIPinchGestureRecognizer alloc]initWithTarget:self action: @selector(viewForZoomingInScrollView:)];
    [self.view addGestureRecognizer:recog];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.imageView;
}


@end
