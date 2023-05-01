--Asignaturas con n?mero m?ximo de creditos

select asi#,nombreas,credt+credpr creditos from asigna where
 (credt+credpr)=any(select max(credt+credpr) from asigna)
/
