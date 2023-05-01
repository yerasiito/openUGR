create table equipos(
  codE char(3)  constraint codE_clave_primaria primary key,
    nombreE varchar(30) constraint nombreE_no_nulo not null
    constraint nombreE_unico unique,
    localidad varchar(30) constraint localidad_no_nulo not null,
    entrenador varchar(30) constraint entrenador_no_nulo not null,
    fecha_crea date default sysdate   
);

create table jugadores(
  codJ char(3) constraint codJ_clave_primaria primary key,
  codE char(3) constraint codE_no_nulo_jugadores not null constraint codE_clave_externa references equipos(codE),
  nombreJ char(30) constraint nombreJ_no_nulo not null constraint nombreJ_unico unique
);

create table encuentros(
  eq1 char(3) constraint eq1_clave_externa references equipos(codE),
  eq2 char(3) constraint eq2_clave_externa references equipos(codE),
  fecha date constraint fecha_no_nulo not null,
  res1 number default 0 constraint res1_mayor_0 check (res1>=0),
  res2 number default 0 constraint res2_mayor_0 check (res2>=0), 
  constraint eq1eq2_clave_primaria primary key(eq1, eq2)
);

create table faltas(
  codJ char(3) constraint codJ_no_nulo_faltas not null,
  eq1 char(3) constraint eq1_no_nulo_faltas not null,
  eq2 char(3)  constraint eq2_no_nulo_faltas not null,
  num number default 0 constraint valor_entre_0_5 check (num>=0 and num<=5),
  constraint codJEq1Eq2_clave_primaria primary key(codJ, eq1, eq2),
  constraint eq1eq2_clave_externa foreign key(eq1, eq2) references encuentros(eq1, eq2),
  constraint codj_clave_externa foreign key(codJ) references jugadores(codJ)
);


 
