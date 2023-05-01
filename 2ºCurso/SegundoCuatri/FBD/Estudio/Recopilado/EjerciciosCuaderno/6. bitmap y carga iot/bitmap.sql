create table prueba_bit( color varchar2(10)

BEGIN
FOR i IN 1..50000 LOOP
INSERT INTO Prueba_bit (
select decode(round(dbms_random.value(1,4)),1,'Rojo',2,'Verde',
3,'Amarillo',4,'Azul') from dual);
END LOOP;
END;

create index prueba_idx on prueba_bit(color);

 select count(*) from prueba_bit WHERE color='Azul' or color='Amarillo';
 
 drop index prueba_idx

create bitmap index prueba_bitmap_idx on prueba_bit(color)

drop table prueba_bit