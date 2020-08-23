abstract class Payment {
  void solve(int value);
}

class PicPay implements Payment {
  solve(int value) {
    print("Payment confirmed in PicPay: R\$ $value");
  }
}

class Cielo implements Payment {
  solve(int value) {
    value += 10;
    print("Payment confirmed in Cielo: R\$ $value");
  }
}

void main() {
  final Payment picPayPayment = PicPay();
  final Payment cieloPayment = Cielo();

  picPayPayment.solve(10);
  cieloPayment.solve(10);
}
