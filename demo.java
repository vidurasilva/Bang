import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class demo {

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
System.out.println("Enter the number of entity");
        int n = in.nextInt();

        System.out.println("Which elimant is select");
        int k = in.nextInt();

        System.out.println("What is store in their");
        int q = in.nextInt();
        int[] a = new int[n];
        int[] qarr = new int[q];
        for(int a_i=0; a_i < n; a_i++){
            a[a_i] = in.nextInt();
        }
  int[] rot=new int[n];
        int ak;
        for(ak=0; ak < k; ak++){
            rot[ak] = a[((n-1)-ak)];
             } 
                           for(int j=0;j<k-1;j++){
                                    for(int i=0;i<k-(j+1);i++){
                                        int temp=rot[i+1];
                                        rot[i+1]=rot[i];
                                        rot[i]=temp;
                                    }
                            }
                      for(int ar=ak;ar<n;ar++){
                            rot[ar]=a[ar-ak];
                        }
     for(int a0 = 0; a0 < q; a0++){
            int m = in.nextInt();
            qarr[a0]=rot[m];
        }

        for(int q0=0;q0<q;q0++){
            System.out.println(qarr[q0]);
        }           
}
}