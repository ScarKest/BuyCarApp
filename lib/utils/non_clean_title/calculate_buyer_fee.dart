

int calculateBuyerFeeNCTitle(int price, String typeTitle) {
  final feeTableSecuredPayment = <List<int>>[
    [50, 25],
    [100, 45],
    [200, 80],
    [400, 120],
    [500, 160],
    [600, 185],
    [700, 210],
    [800, 230],
    [900, 250],
    [1000, 275],
    [1200, 325],
    [1300, 350],
    [1400, 365],
    [1500, 380],
    [1600, 390],
    [1700, 410],
    [1800, 420],
    [2000, 440],
    [2400, 470],
    [2500, 480],
    [3000, 500],
    [3500, 600],
    [4000, 675],
    [4500, 710],
    [5000, 750],
    [5500, 750],
    [6000, 750],
    [6500, 800],
    [7000, 800],
    [7500, 800],
    [8000, 815],
    [8500, 840],
    [9000, 840],
    [10000, 840],
    [10500, 850],
    [11000, 850],
    [11500, 850],
    [12000, 850],
    [12500, 850],
    [15000, 850],
    [16000, 8],
  ];
  final feeTableUnsecuredPayment = <List<int>>[
    [50, 28],
    [100, 50],
    [200, 90],
    [300, 135],
    [350, 138],
    [400, 140],
    [450, 183],
    [500, 185],
    [550, 213],
    [600, 215],
    [700, 245],
    [800, 270],
    [900, 295],
    [1000, 325],
    [1200, 385],
    [1300, 415],
    [1400, 435],
    [1500, 455],
    [1600, 470],
    [1700, 495],
    [1800, 510],
    [2000, 540],
    [2400, 590],
    [2500, 605],
    [3000, 650],
    [3500, 775],
    [4000, 875],
    [4500, 935],
    [5000, 1000],
    [5500, 1000],
    [6000, 1000],
    [6500, 1050],
    [7000, 1050],
    [7500, 1050],
    [8000, 1065],
    [8500, 1090],
    [9000, 1090],
    [10000, 1090],
    [10500, 1200],
    [11000, 1200],
    [11500, 1200],
    [12000, 1200],
    [12500, 1200],
    [15000, 1200],
    [16000, 13],

  ];
  if (typeTitle == 'Secure') {
    for (final feeEntry in feeTableSecuredPayment) {
      if (price < feeEntry[0]) {
        return feeEntry[1];
      }
    }
  } else {
    for (final feeEntry in feeTableUnsecuredPayment) {
      if (price < feeEntry[0]) {
        return feeEntry[1];
      }
    }
  }

  return 0;
}

/**
 * Secured Payment Methods

Final Bid Price	Non-Clean Title
$0 - $49.99	$25.00
$50.00 - $99.99	$45.00
$100.00 - 199.99	$80.00
$200.00 - $299.99	$130.00
$300.00 - $349.99	$132.50
$350.00 - $399.99	$135.00
$400.00 - $449.99	$170.00
$450.00 - $499.99	$180.00
$500.00 - $549.99	$200.00
$550.00 - $599.99	$205.00
$600.00 - $699.99	$235.00
$700.00 - $799.99	$260.00
$800.00 - $899.99	$280.00
$900.00 - $999.99	$305.00
$1,000.00 - $1,199.99	$355.00
$1,200.00 - $1,299.99	$380.00
$1,300.00 - $1,399.99	$400.00
$1,400.00 - $1,499.99	$410.00
$1,500.00 - $1,599.99	$420.00
$1,600.00 - $1,699.99	$440.00
$1,700.00 - $1,799.99	$450.00
$1,800.00 - $1,999.99	$465.00
$2,000.00 - $2,399.99	$500.00
$2,400.00 - $2,499.99	$525.00
$2,500.00 - $2,999.99	$550.00
$3,000.00 - $3,499.99	$650.00
$3,500.00 - $3,999.99	$700.00
$4,000.00 - $4,499.99	$725.00
$4,500.00 - $4,999.99	$750.00
$5,000.00 - $5,499.99	$775.00
$5,500.00 - $5,999.99	$775.00
$6,000.00 - $6,499.99	$800.00
$6,500.00 - $6,999.99	$800.00
$7,000.00 - $7,499.99	$825.00
$7,500.00 - $7,999.99	$825.00
$8,000.00 - $8,499.99	$850.00
$8,500.00 - $8,999.99	$850.00
$9,000.00 - $9,999.99	$850.00
$10,000.00 - $10,499.99	$900.00
$10,500.00 - $10,999.99	$900.00
$11,000.00 - $11,499.99	$900.00
$11,500.00 - $11,999.99	$900.00
$12,000.00 - $12,499.99	$900.00
$12,500.00 - $14,999.99	$900.00
$15,000.00+	7.50%
 */

/**
 * Unsecured Payment Methods

Final Bid Price	Non-Clean Title
$0 - $49.99	$27.50
$50.00 - $99.99	$50.00
$100.00 - 199.99	$90.00
$200.00 - $299.99	$145.00
$300.00 - $349.99	$150.00
$350.00 - $399.99	$155.00
$400.00 - $449.99	$192.50
$450.00 - $499.99	$205.00
$500.00 - $549.99	$227.50
$550.00 - $599.99	$235.00
$600.00 - $699.99	$270.00
$700.00 - $799.99	$300.00
$800.00 - $899.99	$325.00
$900.00 - $999.99	$355.00
$1,000.00 - $1,199.99	$415.00
$1,200.00 - $1,299.99	$445.00
$1,300.00 - $1,399.99	$470.00
$1,400.00 - $1,499.99	$485.00
$1,500.00 - $1,599.99	$500.00
$1,600.00 - $1,699.99	$525.00
$1,700.00 - $1,799.99	$540.00
$1,800.00 - $1,999.99	$565.00
$2,000.00 - $2,399.99	$620.00
$2,400.00 - $2,499.99	$650.00
$2,500.00 - $2,999.99	$700.00
$3,000.00 - $3,499.99	$825.00
$3,500.00 - $3,999.99	$920.00
$4,000.00 - $4,499.99	$935.00
$4,500.00 - $4,999.99	$1,000.00
$5,000.00 - $5,499.99	$1,025.00
$5,500.00 - $5,999.99	$1,025.00
$6,000.00 - $6,499.99	$1,050.00
$6,500.00 - $6,999.99	$1,050.00
$7,000.00 - $7,499.99	$1,075.00
$7,500.00 - $7,999.99	$1,075.00
$8,000.00 - $8,499.99	$1,100.00
$8,500.00 - $8,999.99	$1,100.00
$9,000.00 - $9,999.99	$1,100.00
$10,000.00 - $10,499.99	$1,250.00
$10,500.00 - $10,999.99	$1,250.00
$11,000.00 - $11,499.99	$1,250.00
$11,500.00 - $11,999.99	$1,250.00
$12,000.00 - $12,499.99	$1,250.00
$12,500.00 - $14,999.99	$1,250.00
$15,000.00+	12.50%
 */