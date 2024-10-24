function [lake_volume, x, y, z, zmin] = zadanie5()
    % Funkcja zadanie5 wyznacza objętość jeziora metodą Monte Carlo.
    %
    %   lake_volume - objętość jeziora wyznaczona metodą Monte Carlo
    %
    %   x - wektor wierszowy, który zawiera współrzędne x wszystkich punktów
    %       wylosowanych w tej funkcji w celu wyznaczenia obliczanej całki.
    %
    %   y - wektor wierszowy, który zawiera współrzędne y wszystkich punktów
    %       wylosowanych w tej funkcji w celu wyznaczenia obliczanej całki.
    %
    %   z - wektor wierszowy, który zawiera współrzędne z wszystkich punktów
    %       wylosowanych w tej funkcji w celu wyznaczenia obliczanej całki.
    %
    %   zmin - minimalna dopuszczalna wartość współrzędnej z losowanych punktów

    %%%%%
    N = 1e6; 
    zmin = -45;
    x = 100*rand(1,N); 
    y = 100*rand(1,N); 

    z = zmin*rand(1,N); 
    h = get_lake_depth(x,y);  % Głębokość jeziora dla punktów
    N1 = sum(z >= h);  % Punkty leżące poniżej powierzchni jeziora
    V = 100*100*45;  % OObjętości prostopadłościanu dla losowanych pkt
    lake_volume = N1 * V / N;  % Objętości jeziora - Monte Carlo
    %%%%%
end