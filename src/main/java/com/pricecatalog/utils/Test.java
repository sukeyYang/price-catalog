package com.pricecatalog.utils;

import java.util.*;

/**
 * Created by sukey on 2017/3/11.
 */
public class Test {

    public static int test(String s){
//        int length=1;
//             if(s==null || "".equals(s)){
//                 length=0;
//             }
//        for(int i=0 ;i <s.length();i++){
//            String  a ="";
//            Set<Character> set =new HashSet<>();
//
//            for(int j = i;j<s.length();j++){
//
//                if(set.contains(s.charAt(j))){
//
//                    break;
//                }
//                a+=String.valueOf(s.charAt(j));
//                set.add(s.charAt(j));
//                if(a.length()>length)
//                    length = a.length();
//
//            }
//        }
//        return length;
        int ret = 0;
            Map<Character, Integer> map = new HashMap<>();
            for (int i = 0, start = 0; i < s.length(); i++) {
                char c = s.charAt(i);
                if (map.containsKey(c))
                    start = Math.max(map.get(c)+1, start);
                ret = Math.max(ret, i-start+1);
                map.put(c, i);
            }
            return ret;
    }

    public static void main(String[] args ){
        System.out.println(test("qpxrjxkltzyx"));
    }

}
