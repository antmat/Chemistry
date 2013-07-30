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
bool gauss (const NSArray* matrix, NSMutableArray* result)
{
    if(result == nil)
    {
        result = [[NSMutableArray alloc] init];
    }
    int n,i,j,k;
    double a[10][10],c,d[10]={0};
    n = [matrix count];
    for(i=0;i<n;i++)
    {
        assert([[matrix objectAtIndex:i] count] == n);
        for(j=0;j<=n;j++)
            //cin>>a[i][j];
            a[i][j] = [[[matrix objectAtIndex:i] objectAtIndex:j] floatValue];
    }
    for(i=n-1;i>0;i--)        // partial pivoting
    {
        if(a[i-1][0]<a[i][0])
            for(j=0;j<=n;j++)
            {
                c=a[i][j];
                a[i][j]=a[i-1][j];
                a[i-1][j]=c;
            }
    }

    //********* changing to upper triangular matrix*************//
    //********* Forward elimination process**************//
    for(k=0;k<n-1;k++)
        for(i=k;i<n-1;i++)
        {
            c= (a[i+1][k]/a[k][k]) ;
            for(j=0;j<=n;j++)
                a[i+1][j]-=c*a[k][j];
        }

    //***************** Backward Substitution method****************//

    for(i=n-1;i>=0;i--)
    {
        c=0;
        for(j=i;j<=n-1;j++)
            c=c+a[i][j]*d[j];

        d[i]=(a[i][n]-c)/a[i][i];
        if(isnan(d[i]))
        {
            d[i] = 1;
        }
        if(isinf(d[i]))
        {
            return NO;
        }
    }

    //******** RESULT DISPLAY *********//

    for(i=0;i<n;i++)
        [result addObject:[NSNumber numberWithDouble:d[i]]];


    return result;
}