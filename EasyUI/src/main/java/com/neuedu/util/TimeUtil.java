package com.neuedu.util;

import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017-01-04.
 */
@Repository
public class TimeUtil {

    public  String TranslatTime(String time){
        String [] times=time.split("/");
        String []temp=times[2].split(" ");
        return temp[0]+"-"+times[0]+"-"+times[1]+" "+temp[1];
    }


}
