package com.neuedu.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Administrator on 2016-12-28.
 */
public class RandomUtil {


    public static List<Integer> getNumer(int max){
        Random r = new Random();
        List<Integer> list = new ArrayList<Integer>();
        int i;
        while(list.size() < 5){
            i = r.nextInt(max);
            if(!list.contains(i)){
                list.add(i);
            }
        }
        return list;
    }

}
