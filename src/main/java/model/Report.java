package model;

public class Report {
    private String name;
    private String email;
    private String phone;
    private String title;
    private String description;

    public Report() {
    }

    public Report(String name, String email, String phone, String title, String description) {
        super();
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.title = title;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


}
