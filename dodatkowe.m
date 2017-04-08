close all
%obraz=lena(:,:,1);
%obraz=lena;
%obraz=cdata;
obraz=imread('lena.jpg');
obraz=obraz(:,:,1);
filtrowanyobraz=zeros(size(obraz));
L=zeros(size(obraz));
LL=zeros(size(obraz));
[a,b]=size(obraz);
for poziom=1:1
    LP=filtra(poziom); %filtw dolnoprzepustowy
    FTLP=freqz(LP,b);
    HP=filtrb(poziom); %filtr górnoprzepustowy 
    FTHP=freqz(HP,a);
    for k=1:b
    %for k=1:length(obraz(1,:)) %analiza "po wierszach"
        x=obraz(k,:);
        FTx=fft(x).'; %Discrete Fourier Transform 
        L(k,:)=ifft(FTLP.*FTx);
        H(k,:)=ifft(FTHP.*FTx);
    end
    for k=1:a
    %for k=1:length(obraz(1,:)) % "po kolumnach" 
        x=L(:,k);
        FTx=fft(x);
        y=H(:,k);
        FTy=fft(y);
        LL(:,k)=ifft(FTLP.*FTx); %Inverse Discrete Fourier Transform
        LH(:,k)=ifft(FTHP.*FTx);
        HL(:,k)=ifft(FTLP.*FTy);
        HH(:,k)=ifft(FTHP.*FTy);
    end
end
    image=abs(LH+HL+HH);
    figure
    imagesc(abs(LL)), title('LL')
    figure
    imagesc(abs(LH)), title('LH')
    figure
    imagesc(abs(HL)), title('HL')
    figure
    imagesc(abs(HH)), title('HH')
    figure
    imagesc(image), title('suma detali')

