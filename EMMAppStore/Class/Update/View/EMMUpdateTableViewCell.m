//
//  EMMUpdateTableViewCell.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/9.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMUpdateTableViewCell.h"
#import "PKDownloadButton.h"
#import "PKDownloaderSimulator.h"

@interface EMMUpdateTableViewCell ()<PKDownloadButtonDelegate, PKDownloaderSimulatorDelegate>

@property (weak, nonatomic) IBOutlet PKDownloadButton *downloadButton;

@property (nonatomic, strong) PKDownloaderSimulator *downloaderSimulator;
@property (nonatomic, strong) PKDownloaderSimulator *pendingSimulator;

// UI
@property (weak, nonatomic) IBOutlet UIImageView *icon; // 图标
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIButton *funBtn;



@end

@implementation EMMUpdateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
}

- (void)layoutSubviews{
    self.downloaderSimulator = [[PKDownloaderSimulator alloc] initWithProgressInterval:0.1];
    self.downloaderSimulator.delegate = self;
    self.pendingSimulator = [[PKDownloaderSimulator alloc] initWithProgressInterval:0.05];
    self.pendingSimulator.delegate = self;
}

#pragma mark - ********** 按钮的点击事件 **********
- (IBAction)newFunctionButtonOnClick:(id)sender {
    YHLog(@"新功能..");
    
    _funBtn.hidden = YES;
    _date.hidden = NO;
    
//    CGRect frame = self.frame;
//    frame.size.height = 144;
//    self.frame = frame;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(reloadData:withHeight:)]) {
        [self.delegate reloadData:self withHeight:144];
    }
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 80, ScreenW-20, 50)];
    textView.text = @"1、微聊升级，支持语音和视频聊天\n2、增加经理人服务信息，帮你挑选好经理人\n3、小区单页体验优化\n4、新增楼盘问答，可以针对楼盘提出个性化问题";
    textView.editable = NO;
    textView.userInteractionEnabled = NO;
    [self addSubview:textView];
}

#pragma mark - PKDownloadButtonDelegate

- (void)downloadButtonTapped:(PKDownloadButton *)downloadButton
                currentState:(PKDownloadButtonState)state {
    switch (state) {
        case kPKDownloadButtonState_StartDownload:
            self.downloadButton.state = kPKDownloadButtonState_Pending;
            [self.pendingSimulator startDownload];
            break;
        case kPKDownloadButtonState_Pending:
            [self.pendingSimulator cancelDownload];
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            break;
        case kPKDownloadButtonState_Downloading:
            [self.downloaderSimulator cancelDownload];
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            break;
        case kPKDownloadButtonState_Downloaded:
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            self.imageView.hidden = YES;
            break;
        default:
            NSAssert(NO, @"unsupported state");
            break;
    }
}

#pragma mark - DownloaderSimulatorDelegate

- (void)simulator:(PKDownloaderSimulator *)simulator didUpdateProgress:(double)progress {
    if (simulator == self.pendingSimulator) {
        if (progress == 1.) {
            // 开始下载
            self.downloadButton.state = kPKDownloadButtonState_Downloading;
            [self.downloaderSimulator startDownload];
        }
    }
    else if (simulator == self.downloaderSimulator) {
        self.downloadButton.stopDownloadButton.progress = progress;
        if (progress == 1) {
            self.downloadButton.state = kPKDownloadButtonState_Downloaded;
            self.imageView.hidden = NO;
        }
    }
}

@end
