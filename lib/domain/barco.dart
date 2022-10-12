class Barco {
    Barco({
        required this.florida,
        required this.california,
    });

    final List<Port> florida;
    final List<Port> california;
}

class Port {
    Port({
        required this.size,
        required this.price,
    });

    final String size;
    final int price;
}
