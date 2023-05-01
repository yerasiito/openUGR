select  distinct nombreas from alumnos,asigna,matricula
    where (  caracter='op' and credt+credpr>=4.5 and 
nombre='Luis' and ape1='Perez' and ape2='Jimenez' and
 alumnos.dni=matricula.dni and codasi#=asi#)  order by nombreas
/
