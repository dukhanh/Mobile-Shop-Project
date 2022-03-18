package service;

public class AssessService {
    private static AssessService instance;

    private AssessService() {
    }

    public static AssessService getInstance() {
        if (instance == null) {
            instance = new AssessService();
        }
        return instance;
    }

    public String printStar(int rate) {
        StringBuilder result = new StringBuilder();
        for (int i = 1; i < rate + 1; i++) {
            result.append("<span><i class=\"fa fa-star\"></i></span>\n");
        }
        for (int j = rate + 1; j < 6; j++) {
            result.append("<span><i class=\"fa fa-star-o\"></i></span>\n");
        }
        return result.toString();
    }

    public static void main(String[] args) {
        System.out.println(getInstance().printStar(4));
    }
}
