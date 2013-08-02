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
    if(a>b)
        return getGcd(a, a%b);
    else
        return getGcd(b, b%a);
}


bool gauss_internal (const NSArray* matrix, NSMutableArray* result, double second_coeff)
{
    if(result == nil)
    {
        result = [[NSMutableArray alloc] init];
    }
    int n,m,i,j,k;
    double a[MAX_MATRIX_SIZE][MAX_MATRIX_SIZE],c,d[MAX_MATRIX_SIZE]={0};
    n = [matrix count];
    m = [[matrix objectAtIndex:0] count];
    if(m > MAX_MATRIX_SIZE || n > MAX_MATRIX_SIZE) {
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
/*
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
*/
    for(k=0;k<n-1;k++)
    {
        if(a[k][k] == 0)
        {
            for(i=n-1;i>k;i--)        // partial pivoting
            {
                if(a[i][k]!=0)
                {
                    for(j=0;j<m;j++)
                    {
                        c=a[i][j];
                        a[i][j]=a[k][j];
                        a[k][j]=c;
                    }
                    break;
                }
            }
        }
        for(i=k;i<n-1;i++)
        {
            c= (a[i+1][k]/a[k][k]) ;
            if(a[i+1][k] != 0.0)
            {
                if(isnan(c))
                {
                    return NO;
                }
                for(j=0;j<m;j++)
                {
                    a[i+1][j]-=c*a[k][j];
                }
            }
        }
    }

    bool isSetFreeMember = NO;
    for(i=n-1;i>=0;i--)
    {
        c=0;
        for(j=i;j<=n-1;j++)
            c=c+a[i][j]*d[j];

        d[i]=(a[i][n]-c)/a[i][i];
        if(isnan(d[i]))// || (d[i] <0.001 && d[i] > -0.001))
        {
            if(!isSetFreeMember)
            {
                d[i] = 1.0;
                isSetFreeMember = YES;
            }
            else
            {
                d[i] = second_coeff;
            }
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
            if (cnt >= 10.0) {
                return NO;
            }
            gcd = getGcd(gcd, (int)inverted);
        }
    }
    if(gcd == 0){
        gcd = 1;
    }


    for(i=0;i<n;i++)
    {
        if(d[i]*gcd <= 0.0)
        {
            if(second_coeff <=5.0)
            {
                [result removeAllObjects];
                return gauss_internal (matrix, result, second_coeff+0.2);
            }
            else
            {
                return NO;
            }
        }
        [result addObject:[NSNumber numberWithUnsignedInt:(unsigned int)(d[i]*gcd)]];
    }
    return YES;
}
bool gauss (const NSArray* matrix, NSMutableArray* result)
{
    return gauss_internal(matrix, result, 0.2);
}

