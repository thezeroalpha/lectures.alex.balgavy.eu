+++
title = 'Point processing'
+++
# Point processing
A simple function applied to each value — e.g. to lighten, y = x+C

Ex: change brightness of every pixel in the same way

![screenshot.png](3324add035d108efc1dc36a5adc53f9f.png)

```
b = imread(‘filename.bmp’);
b1 = imadd(b,128);
```

## Type conversion
From RGB to grayscale (24 bits -> 8 bits)

```
I = imread(‘filename.bmp’);
J = rgb2gray(I);
```

## Histogram stretching

A histogram graphs the amount of times each value from 0 to 255 occurs in an image.

You can stretch a histogram to equalise the image

![screenshot.png](4f05a88f44157b44d30209a3fa3a1941.png)

## Thresholding

- a gray scale image can be converted into binary (B&W)
- choose a grey level T (threshold), change each pixel based on relation to T
- white if >T, black if ≤T

![screenshot.png](14678296b2a9a5e2df1e024513278322.png)
