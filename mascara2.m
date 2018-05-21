pkg load video
pkg load image
info = aviinfo("C:/Users/Adan/Desktop/video.avi");
U = aviread("C:/Users/Adan/Desktop/video.avi",1);
H = rgb2hsv(U);
imgH = H(:,:,1);
imgBN1 = 0.4 >= imgH;
imgBN2 = 0.6 >= imgH;
G = imgBN1 & imgBN2;
%Vemos la interseccion de ambos 
G(1:85,430:640) = 0; 
%Quitamos el logo
imgBN = bwfill(G,"holes");
 %llenamos huecos pequeños
imcom = imcomplement(imgBN);
I = nnz(imcom)%Aca calcula la cantidad para el bwearopen
%Termina de llenar los huecos grandes
F = bwareaopen(imgBN,I);
%Imprime la imagen
imgH = uint8(imgH*255);
imgV = imgH;

for x = 2:(rows(imgH)-1)
    for y = 2:(columns(imgH)-1)
        
        pedacito = imgH(x-1:x+1,y-1:y+1);
    
        parcial = 0;
        
        for i = (x-1):(x+1)
          for j = (y-1):(y+1)
            
              parcial += (imgH(i,j) - mean(mean(pedacito)))**2;
            
          endfor
        endfor
        imgV(x,y) = parcial/9;
    endfor
endfor
GT = graythresh(imgV);    
imgbw = im2bw(imgV, GT)

L = imgbw & F;
imgfinal = bwfill(L,"holes");
imshow(imgfinal);