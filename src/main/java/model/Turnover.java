package model;

public class Turnover {
    private int month;
    private int year;
    private int soldProduct;
    private int countOrder;
    private long totalIncome;

    public Turnover(){

    }

    public Turnover(int month, int year, int soldProduct, int countOrder, long totalIncome) {
        this.month = month;
        this.year = year;
        this.soldProduct = soldProduct;
        this.countOrder = countOrder;
        this.totalIncome = totalIncome;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getSoldProduct() {
        return soldProduct;
    }

    public void setSoldProduct(int soldProduct) {
        this.soldProduct = soldProduct;
    }

    public int getCountOrder() {
        return countOrder;
    }

    public void setCountOrder(int countOrder) {
        this.countOrder = countOrder;
    }

    public long getTotalIncome() {
        return totalIncome;
    }

    public void setTotalIncome(long totalIncome) {
        this.totalIncome = totalIncome;
    }

    @Override
    public String toString() {
        return "Turnover{" +
                "month=" + month +
                ", year=" + year +
                ", soldProduct=" + soldProduct +
                ", countOrder=" + countOrder +
                ", totalIncome=" + totalIncome +
                '}';
    }
}
