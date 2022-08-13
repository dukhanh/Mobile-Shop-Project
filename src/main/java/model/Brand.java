package model;

import java.io.Serializable;

public class Brand implements Serializable {
    private int id;
    private String name;
    private String logo;
    private int ID;
    private String TENTH;
    private int SO_LUONG;

    public Brand(){

    }

    public Brand(int ID, String TENTH, int SO_LUONG) {
        this.ID = ID;
        this.TENTH = TENTH;
        this.SO_LUONG= SO_LUONG;
    }

    public Brand(int id, String name, String logo){
        this.id = id;
        this.name = name;
        this.logo = logo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTENTH() {
        return TENTH;
    }

    public void setTENTH(String TENTH) {
        this.TENTH = TENTH;
    }

    public int getSO_LUONG() {
        return SO_LUONG;
    }

    public void setSO_LUONG(int SO_LUONG) {
        this.SO_LUONG = SO_LUONG;
    }
}
