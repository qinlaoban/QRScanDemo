/**
 *  直接填写小数
 */
#define QRDecimalColor(r, g, b, a)    [UIColor colorWithRed:r green:g blue:b alpha:a]

/**
 *  直接填写整数
 */
#define QRColor(r, g, b, a)    [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a]

/**
 *  随机颜色
 */
#define QRRandom    QRColor(arc4random() % 256, arc4random() % 256, arc4random() % 256, 1)

#define QRBlack         [UIColor blackColor]
#define QRDarkGray      [UIColor darkGrayColor]
#define QRLightGray     [UIColor lightGrayColor]
#define QRWhite         [UIColor whiteColor]
#define QRGray          [UIColor grayColor]
#define QRRed           [UIColor redColor]
#define QRGreen         [UIColor greenColor]
#define QRBlue          [UIColor blueColor]
#define QRCyan          [UIColor cyanColor]
#define QRYellow        [UIColor yellowColor]
#define QRMagenta       [UIColor magentaColor]
#define QROrange        [UIColor orangeColor]
#define QRPurple        [UIColor purpleColor]
#define QRBrown         [UIColor brownColor]
#define QRClear         [UIColor clearColor]
#define QRSkyBlue       QRDecimalColor(0, 0.68, 1, 1)
#define QRLightBlue     QRColor(125, 231, 255, 1)
#define QRFicelle       QRColor(247, 247, 247, 1)
#define QRTaupe         QRColor(238, 239, 241, 1)
#define QRTaupe2        QRColor(237, 236, 236, 1)
#define QRGrassGreen    QRColor(254, 200, 122, 1)
#define QRGold          QRColor(255, 215, 0, 1)
#define QRDeepPink      QRColor(238, 18, 137, 1)
