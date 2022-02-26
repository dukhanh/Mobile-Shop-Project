package model;

public class Cart extends Product {
    private int quantity;

    // constructor null
    public Cart() {

    }

    public Cart(int quantity) {
        super();
        this.quantity = quantity;
    }

    // getter setter
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
