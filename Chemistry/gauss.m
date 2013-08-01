//
//  File.c
//  Chemistry
//
//  Created by Anton Matvenko on 29.07.13.
//  Copyright (c) 2013 Anton Matveenko. All rights reserved.
//

#include <stdio.h>
#import <Foundation/Foundation.h>
/************* Gauss elimination for solving linear equations *************/

#include<math.h>
#define MAX_MATRIX_SIZE 15
int getGcd (int a, int b)
{
    if(a == 0)
        return b;
    if(b == 0)
        return a;
    return getGcd(a, a%b);
}

bool gauss (const NSArray* matrix, NSMutableArray* result)
{
/*
    unsigned short n = [matrix count]; // amount of rows
    if(n ==0) {
        return YES;
    }
    unsigned short m = count($matrix[0])-1; // amount of columns (variables)
    for ($i = 0; $i < $m; $i++) { // iterations
        for ($ii = 0; $ii < $n; $ii++) { // select row

            // the row should contain 0's at start
            for ($j = 0; $j < $i && $j < $m; $j++)
                if (abs($matrix[$ii][$j]) > self::GAUSS_ERROR) break;

            $coeff = $matrix[$ii][$i];
            // check, if we've really found that row
            if (
                ($j >= $i || $j >= $m) &&
                abs($coeff) > self::GAUSS_ERROR)
                break;
        }
        if ($ii >= $n) {
            // if the row isn't found, check whether it's the last iteration
            if ($i == $m-1) {
                // if it's the last one, than at least one row is the linear combination of the two others
                // so we'll find it and assign the fictive value xn=1 to it
                for ($ii = 0; $ii < $n; $ii++) {
                    for ($j = 0; $j <= $m; $j++)
                        if (abs($matrix[$ii][$j]) > self::GAUSS_ERROR) break;
                    if ($j > $m) break;
                }
                if ($j > $m) {
                    // we've found that row!
                    $matrix[$ii][$i] = 1;
                    $matrix[$ii][$m] = -1;
                    $coeff = $matrix[$ii][$i];
                }
            } else {
                // it's not the last iteration. May be there're other equations containing something useful
                continue;
            }
        }

        // make the first number to be equal 1
        for ($j = $i; $j <= $m; $j++) {
            $matrix[$ii][$j] /= $coeff;
        }

        // walk through the other rows
        for ($i1 = 0; $i1 < $n; $i1++) {
            if ($i1 == $ii) continue; // current row isn't changed
            $coeff = $matrix[$i1][$i]/$matrix[$ii][$i];

            // check if we need to work with this row
            if (abs($coeff) < self::GAUSS_ERROR) continue;

            // substract this row, with the mention of coefficients
            for ($j = $i; $j <= $m; $j++) {
                $matrix[$i1][$j] -= $coeff * $matrix[$ii][$j];
            }
        }
    }

    // gather answers
    $answer = array();
    for ($i = 0; $i < $n; $i++) {
        for ($j = 0; $j < $m; $j++) {
            if (abs($matrix[$i][$j] - 1) < self::GAUSS_ERROR)
                $answer[$j] = -$matrix[$i][$m];
            if (isset($answer[$j]) && abs($answer[$j]-round($answer[$j])) < self::GAUSS_ERROR)
                $answer[$j] = round($answer[$j]);
        }
    }
    // there should be no zero coefficients in answer
    foreach($answer as $coeff)
    if ($coeff == 0)
        return FALSE;
    ksort($answer, SORT_NUMERIC);
    return $answer;

*/

    if(result == nil)
    {
        result = [[NSMutableArray alloc] init];
    }
    int n,m,i,j,k;
    double a[MAX_MATRIX_SIZE][MAX_MATRIX_SIZE],c,d[MAX_MATRIX_SIZE]={0};
    n = [matrix count];
    m = [[matrix objectAtIndex:0] count];
    if(m >= MAX_MATRIX_SIZE || n >= MAX_MATRIX_SIZE) {
        return NO;
    }
    if (m > (n+1)) {
        n = m-1;
    }
    for(i=0;i<n;i++)
    {
        //assert([[matrix objectAtIndex:i] count] == m);
        for(j=0;j<m;j++)
            //cin>>a[i][j];
            if (i>=[matrix count] || j>= [[matrix objectAtIndex:i] count]) {
                a[i][j] = 0.0;
            }
            else {
                a[i][j] = [[[matrix objectAtIndex:i] objectAtIndex:j] floatValue];
            }
    }

    for(i=n-1;i>0;i--)        // partial pivoting
    {
        if(a[i-1][0]<a[i][0])
            for(j=0;j<m;j++)
            {
                c=a[i][j];
                a[i][j]=a[i-1][j];
                a[i-1][j]=c;
            }
    }

    for(k=0;k<n-1;k++)
        for(i=k;i<m-1;i++)
        {
            c= (a[i+1][k]/a[k][k]) ;
            for(j=0;j<m;j++)
                a[i+1][j]-=c*a[k][j];
        }


    for(i=n-1;i>=0;i--)
    {
        c=0;
        for(j=i;j<=n-1;j++)
            c=c+a[i][j]*d[j];

        d[i]=(a[i][n]-c)/a[i][i];
        if(isnan(d[i]) || (d[i] <0.001 && d[i] > -0.001))
        {
            d[i] = 1;
        }
        if(isinf(d[i]))
        {
            return NO;
        }
    }
    int gcd = 0;
    for (i=0;i<n;i++){
        double intpart, inverted, rest;
        rest = modf(d[i], &intpart);
        if (!isinf(rest) && fabs(rest) > 0.001 && (1.0 - fabs(rest) > 0.001)) {
            inverted = 1.0/(modf(d[i], &intpart));
            unsigned short cnt = 0;
            while(cnt <10 && modf(inverted, &intpart) > 0.001) {
                inverted *= 1.0/(modf(inverted, &intpart));
                cnt++;
            }
            if (cnt == 10) {
                return NO;
            }
            gcd = getGcd(gcd, (int)inverted);
        }
    }
    if(gcd == 0){
        gcd = 1;
    }


    for(i=0;i<n;i++)
        [result addObject:[NSNumber numberWithDouble:d[i]*gcd]];
    return YES;

}
