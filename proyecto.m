pkg load video
info = aviinfo("C:/Users/Adan/Desktop/video.avi")
U = aviread("C:/Users/Adan/Desktop/video.avi",1)

% ------Primera máscara------

H = rgb2hsv(U);
imgH = H(:,:,1);
imshow(imgH);
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
imshow(F);
%Imprime la imagen

% ------Segunda máscara------

H = rgb2hsv(U);
imgH = H(:,:,1);
%Normalizando
nm = (255*(imgH-min(min(min(imgH)))))/(max(max(max(imgH)))-min(min(min(imgH))))