{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página}

program Ej11;
const
    dimF = 200;
type
    rango_vec= 1..dimF;
    cadena20= string[20];
    
    fotoPublicada = record
        titulo: cadena20;
        autor: cadena20;
        cant_likes: integer;
        cant_clicks: integer;
        cant_coments: integer;
    end;
    
    vec_publicaciones= array [rango_vec] of fotoPublicada;
function likesAV (autorAct:cadena20; cantLikes:integer):integer;
begin
    if (autorAct = 'ART VANDELAY') then
        likesAV:= cantLikes
    else
        likesAV:=0;
end;
procedure fotoMasVista(cantClicks:integer; var maxVista:integer; titAct:cadena20; var titMax: cadena20);
begin
    if(cantClicks > maxVista) then begin
        maxVista:=cantClicks;
        titMax:=titAct;
    end;
end;
procedure leerFoto (var fp:fotoPublicada);
begin
    with fp do begin
        writeln ('Ingrese el titulo:');
            readln(titulo);
            writeln ('Ingrese el autor:');
            readln(autor);
            writeln ('Ingrese la cant de likes:');
            readln(cant_likes);
            writeln ('Ingrese la cantidad de clicks:');
            readln(cant_clicks);
            writeln ('Ingrese la cantidad de comentarios:');
            readln(cant_coments);
    end;
end;
procedure cargarVector(var v:vec_publicaciones);
var
    foto:fotoPublicada;
    i:rango_vec;
begin
    for i:=1 to dimF do begin
        leerFoto(foto);
        v[i]:=foto;
    end;
end;
var
    vec:vec_publicaciones;
    i,maxVista,cantLikesAV:integer;
    titMax:cadena20;
begin
    maxVista:=-1;
    cantLikesAV:=0;
    cargarVector(vec);
    for i:=1 to dimF do begin
        fotoMasVista(vec[i].cant_clicks,maxVista,vec[i].titulo,titMax);
        cantLikesAV:=cantLikesAV + likesAV(vec[i].autor, vec[i].cant_likes);
        writeln ('Cantidad de comentarios en la foto ', i,' fue ', vec[i].cant_coments);
    end;
    writeln(titMax, 'fue la foto más vista -la que posee mayor cantidad de clics-');
    writeln('Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay” es: ',cantLikesAV);
end.