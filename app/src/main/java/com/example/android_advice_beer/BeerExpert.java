package com.example.android_advice_beer;

import java.util.ArrayList;
import java.util.List;

public class BeerExpert {
    List<String> getBrands(String color){
        List<String> brands = new ArrayList<>();
        switch (color){
            case "amber": {
                brands.add("Jack Amber");
                brands.add("Red Moose");
            }
            break;

            case "light": {
                brands.add("Garage");
                brands.add("Essa");
            }
            break;

            case  "brown": {
                brands.add("Spaten");
                brands.add("Heineken");
            }
            break;

            case  "dark": {
                brands.add("Miller");
                brands.add("Leffe");
            }
            break;
        }

        return brands;
    }
}
