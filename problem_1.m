import compute_homography.*
close all
image1 = imread("city1.jpg");
image2 = imread("city2.jpg");
image3 = imread("city3.jpg");

figure;

x1 = [418.7778;
  478.2417;
  780.4350;
  799.9314 ];



y1 = [497.4131;
  135.7559;
  147.4537;
  561.7510];

imshow(image1);
axis on
hold on;


figure;

x2 = [1.5561;
   74.6673;
  369.0621;
  390.5081];

y2 = [519.8339;
  128.9322;
  167.9249;
  545.1539;];

imshow(image2);
axis on
hold on;


pts1 = transpose([x1,y1,ones(4,1)]);
pts2 = transpose([x2,y2,ones(4,1)]);

H = compute_homography(pts1,pts2);

T = maketform('projective',H);

[image1Transformed,xdataForImage1t,ydataforImage1t] = imtransform(image1, T);


xdataForImage2WrtToImage1=[min(1,xdataForImage1t(1)) max(size(image2,2),xdataForImage1t(2))];
ydataForImage2WrtToImage1=[min(1,ydataforImage1t(1)) max(size(image2,1),ydataforImage1t(2))];

image1Transformed=imtransform(image1,T,'XData',xdataForImage2WrtToImage1,'YData',ydataForImage2WrtToImage1);
image2Transformed=imtransform(image2,maketform('affine',eye(3)),'XData',xdataForImage2WrtToImage1,'YData',ydataForImage2WrtToImage1);

Combined_image1=max(image2Transformed,image1Transformed);
figure;


x4 = [ 1.0e+03 *1.1812;
       1.0e+03 *1.1759;
       1.0e+03 * 1.4665;
       1.0e+03 * 1.4598];
   
y4 = [684.7769;
      399.5074;
      388.8431;
      704.7725];
  
imshow(Combined_image1);

x3 = [48.0000;
      50.0000;
      332.0000;
      326.0000];
  
y3 = [572;
      266;
      266;
      554];
  
  
figure;
imshow(image3)
axis on
hold on;


pts3 = transpose([x3,y3,ones(4,1)]);
pts4 = transpose([x4,y4,ones(4,1)]);

H = compute_homography(pts3,pts4);

T = maketform('projective',H);

[Image3_Transform,xdataForImage3,ydataForImage3] = imtransform(image3, T);

xdataForCombinedImageWrtToImage3=[min(1,xdataForImage3(1)) max(size(Combined_image1,2),xdataForImage3(2))];
ydataForCombinedImageWrtToImage3=[min(1,ydataForImage3(1)) max(size(Combined_image1,1),ydataForImage3(2))];

Image3_Transform=imtransform(image3,T,'XData',xdataForCombinedImageWrtToImage3,'YData',ydataForCombinedImageWrtToImage3);
Combined_image1_Transform=imtransform(Combined_image1,maketform('affine',eye(3)),'XData',xdataForCombinedImageWrtToImage3,'YData',ydataForCombinedImageWrtToImage3);

figure;
Combined_image_final=max(Combined_image1_Transform,Image3_Transform);
imshow(Combined_image_final);
