abstract class Payment {

  int totalToPay = 0;
  int installments = 0;

  final Map<int, int> _INTEREST = {
    0: 0,
    1: 10,
    2: 20,
    3: 30,
    4: 40,
    5: 50,
  };

  void solve();

  int calculateTotalLiquid() =>
      totalToPay - calculateInterest(installments);


  int calculateInterest(int installments) {
    int _interestTotal = 0;

    for (int i = 0; i < installments; i++) {
      _interestTotal+= _INTEREST[i];
    }

    return _interestTotal;
  }

}

class BankSlipPayment extends Payment {
  @override
  void set totalToPay(int _totalToPay) => super.totalToPay = _totalToPay;

  @override
  void set installments(int _installments) => super.installments = _installments;

  @override
  void solve() {
    print("Total liquid ${calculateTotalLiquid()}");
    print("Total ${}()}");
  }


}

void _handlePayment(Payment payment) => payment.solve();

void main() {
  final bankSlipPayment = BankSlipPayment();



}
