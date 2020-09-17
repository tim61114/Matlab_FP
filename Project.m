while 1   
k = menu('Matlab Filter', 'Open File','Crop photo','Clockwise Rotate 90¢X','Counterclockwise Rotate 90¢X','Rotate 180¢X','Brightness','Lower Brightness','Sharpen','Gray Scale','Blur','Red Tint','Green Tint','Blue Tint','Brown Tint','Back','Save','Exit');
    switch k
        case 1 %open file
            [filename, pathname] = uigetfile({'*.jpg';'*.tif';'*.png'},'Select an image');
            r = imread(filename);
            file = r;
            step = r;
            a = 0;
            figure('Menubar','none'),imshow(r);
        case 2 %Crop photo
            %a=imread(filename);
            if(~a)
                a = step;
                %step = a;
            else
                step = a;
            end
            a = imcrop(step);
            figure('Menubar','none'),imshow(a)
            
        case 3 %Clockwise 90
            if(~a)
                a = step;
                %step = a;
            else
                step = a;
            end
            a = imrotate(step,90);
            figure('Menubar','none'),imshow(a)
        case 4 %CounterClockwise 90
             if(~a)
                a = step;
                %step = a;
            else
                step = a;
            end
             a = imrotate(step,270);
             figure('Menubar','none'),imshow(a)
        case 5 %Rotate 180
             if(~a)
                a = step;
                step = a;
            else
                step = a;
            end
             a = imrotate(step,180);
             figure('Menubar','none'),imshow(a)   
        case 6 %Brightness
             if(~a)
                a = step;
                step = a;
            else
                step = a;
            end
              a = double(step);
              a = a/200;
              figure('Menubar','none'),imshow(a)
        case 7 %Lower Brightness
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
              a = double(step);
              a = a/500;
              figure('Menubar','none'),imshow(a)
        case 8 %Exposure
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
             h1=fspecial('unsharp');
             a = imfilter(step,h1);
             figure('Menubar','none'),imshow(a)
        case 9 %Gray Scale
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
             a = rgb2gray(step);
             figure('Menubar','none'),imshow(a);
        case 10 %Blur
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
             h1=fspecial('gaussian');
             a = imfilter(step,h1);
             figure('Menubar','none'),imshow(a)
        case 11 %Red Tint
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
             a(:,:,2) =  step(:,:,2)*0.9;
             a(:,:,3) =  step(:,:,3)*0.9;
             figure('Menubar','none'),imshow(a)
        case 12 %Green Tint
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
             a(:,:,1) =  step(:,:,1)*0.9;
             a(:,:,3) =  step(:,:,3)*0.9;
             figure('Menubar','none'),imshow(a)
        case 13 %Blue Tint
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
             a(:,:,1) =  step(:,:,1)*0.9;
             a(:,:,2) =  step(:,:,2)*0.9;
             figure('Menubar','none'),imshow(a)
        case 14 %Brown Tint
             if(~a)
                a = step;
                step = a;
             else
                step = a;
             end
             a(:,:,1) =  step(:,:,1)+(256-step(:,:,1))*0.4;
             a(:,:,2) =  step(:,:,2)+(256-step(:,:,2))*0.26;
             a(:,:,3) =  step(:,:,3)+(256-step(:,:,3))*0.12;
             figure('Menubar','none'),imshow(a)
        case 15 %Back
            figure('Menubar','none'),imshow(step)
            a = step;
            
        case 16 %Save
            
            [filename, pathname] = uiputfile({'*.jpg'},'Save as');
            str=strcat(pathname,filename);
            if(~a)
                imwrite(step,str,'jpg')
            else
                imwrite(a,str,'jpg')
            end
        case 17 % Exit
             a=questdlg('Are you sure?','Message','yes','no','no');
                if strcmp(a,'yes')
                    return
                end
    end
end