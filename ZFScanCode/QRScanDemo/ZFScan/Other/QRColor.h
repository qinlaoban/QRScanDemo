/**
 *  直接填写小数
 */
#define ZFDecimalColor(r, g, b, a)    [UIColor colorWithRed:r green:g blue:b alpha:a]

/**
 *  直接填写整数
 */
#define QRColor(r, g, b, a)    [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a]

/**
 *  随机颜色
 */
#define ZFRandom    QRColor(arc4random() % 256, arc4random() % 256, arc4random() % 256, 1)

#define ZFBlack         [UIColor blackColor]
#define ZFDarkGray      [UIColor darkGrayColor]
#define ZFLightGray     [UIColor lightGrayColor]
#define ZFWhite         [UIColor whiteColor]
#define ZFGray          [UIColor grayColor]
#define ZFRed           [UIColor redColor]
#define ZFGreen         [UIColor greenColor]
#define ZFBlue          [UIColor blueColor]
#define ZFCyan          [UIColor cyanColor]
#define ZFYellow        [UIColor yellowColor]
#define ZFMagenta       [UIColor magentaColor]
#define ZFOrange        [UIColor orangeColor]
#define ZFPurple        [UIColor purpleColor]
#define ZFBrown         [UIColor brownColor]
#define ZFClear         [UIColor clearColor]
#define ZFSkyBlue       ZFDecimalColor(0, 0.68, 1, 1)
#define ZFLightBlue     QRColor(125, 231, 255, 1)
#define ZFFicelle       QRColor(247, 247, 247, 1)
#define ZFTaupe         QRColor(238, 239, 241, 1)
#define ZFTaupe2        QRColor(237, 236, 236, 1)
#define ZFGrassGreen    QRColor(254, 200, 122, 1)
#define ZFGold          QRColor(255, 215, 0, 1)
#define ZFDeepPink      QRColor(238, 18, 137, 1)
