#encoding: utf-8
namespace :init_wiki do
	desc 'inicializa la wiki'
	task :load => :environment do
		WikiPage.create(:creator_id => 1, :updator_id => 1, 
    				:path=> '', :title => 'Ayuda sistema centros de acopio', :content => '<div class="textContent"> Seleccione alguno de los elementos para obtener ayuda detallada al respecto.</div>
<div class="indexHelp">
* *Entradas/Salidas:*
** [[Ingresos]]
** [[Temporadas]]
** [[Despachos]]
** [[Informes]]
* *Recursos:*
** [[Agrupaciones]]
** [[Calidades]]
** [[Destinos]]
** [[Envases]]
** [[Especies]]
** [[Productores]]
** [[Variedades]]
</div>')
		WikiPage.create(:creator_id => 1, :updator_id => 1, 
    				:path=> 'Agrupaciones', :title => 'Agrupaciones', :content => '<div class="textContent">
Módulo encargado de mantener las agrupaciones. Permite agregar, modificar y eliminar cada una de las agrupaciones.
</div>


<div class="indexHelp">
* "1. Descripciónn de los Campos":#description
** "1.1 Nombre":#f_name
** "1.2 Descripción":#f_description
* "2. Acciones":#actions
** "2.1 Agregar nueva agrupación":#a_add
** "2.2 Editar agrupación existente":#a_edit
** "2.3. Ver agrupación existente":#a_show
** "2.4. Eliminar agrupación existente":#a_delete
* "3. Preguntas Frecuentes":#faq
</div>

<div class="contentHelp">
h2(#description). Descripción de los Campos

h3(#f_name). Nombre:

<div class="contentHelp">
Campo que almacena el nombre de la agrupación.
</div>

h3(#f_description). Descripción:

<div class="contentHelp">
Campo que almacena una breve descripción de la agrupación.
</div>


h2(#actions). Acciones

h3(#a_add). Agregar nueva agrupación:

<div class="textContent">
Para agregar una nueva agrupación, primero debemos seleccionar el módulo "Agrupaciones" en la barra de navegación (a la izquierda), ubicada dentro de "Recursos".
!/help/img/grouping/add_1.png!
El Sistema mostrará en pantalla una lista de todos las agrupaciones agregadas con anterioridad (Si se ha ingresado por primera vez, no mostrará ninguna).
Presionamos el botón "Nueva Agrupación", en la esquina superior derecha.
!/help/img/grouping/add_2.png!
Llenamos la información correspondiente (Los campos obligatorios se destacan con un *). Posteriormente guardamos para continuar o simplemente cancelamos.
!/help/img/grouping/add_3.png!
Finalmente, el sistema volverá a la página principal de agrupaciones y mostrará en la tabla la agrupación agregada.
!/help/img/grouping/add_4.png!
</div>

h3(#a_edit). Editar agrupación existente:

<div class="textContent">
Para editar una agrupación existente, en la página principal del módulo "Agrupaciones", seleccionamos "Editar"
(ubicada al extremo opuesto de la agrupación por editar y dentro de la columna "acciones").
!/help/img/grouping/edit_1.png!
El Sistema cargará el formulario de ingreso, pero esta vez mostrará los datos que ya se han ingresado. En este punto se puede modificar la información de dichos campos o no.
Marcamos en el botón "Guardar" para confirmar los nuevos cambios o simplemente cancelamos.
!/help/img/grouping/edit_2.png!
Finalmente, el sistema volverá a la página principal de agrupaciones y mostrará en la tabla el o los datos modificados.
!/help/img/grouping/edit_3.png!
</div>

h3(#a_show). Ver agrupación existente:

<div class="textContent">
Para ver los datos de una agrupación existente, en la página principal del módulo "Agrupaciones", seleccionamos "Ver"
(ubicada al extremo opuesto de la agrupación por ver y dentro de la columna "acciones"). 
!/help/img/grouping/show_1.png!
El Sistema mostrará los datos de la agrupación seleccionada, sin opción de modificación. Además, listará los productores pertenecientes a dicha agrupación en la tabla (en caso de tener).
Por lo demás, en este punto, el sistema permite editar los datos o simplemente volver a la página principal del módulo.
!/help/img/grouping/show_2.png!
Finalmente, el sistema volverá a la página principal de agrupaciones o de edición dependiendo de la acción tomada.!
</div>

h3(#a_delete). Eliminar agrupación existente:

<div class="textContent">
Para eliminar los datos de una agrupación existente, en la página principal del módulo "Agrupaciones", seleccionamos "Eliminar"
(ubicada al extremo opuesto de la agrupación por eliminar y dentro de la columna "acciones"). 
!/help/img/grouping/delete_1.png!
El Sistema mostrará un dialogo preguntando si deseamos eliminar la agrupación.
!/help/img/grouping/delete_2.png!
Si marcamos el botón "Aceptar", la agrupación desaparecerá de la lista de agrupaciones.
!/help/img/grouping/delete_3.png!
</div>

h2(#faq). Preguntas Frecuentes

Actualmente no existen preguntas frecuentes.
</div>)

end')
		WikiPage.create(:creator_id => 1, :updator_id => 1, 
    				:path=> 'Calidades', :title => 'Calidades', :content => '<div class="textContent">
Módulo encargado de mantener las calidades. Permite agregar, modificar y eliminar cada una de las calidades.
</div>


<div class="indexHelp">
* "1. Descripciónn de los Campos":#description
** "1.1 Nombre":#f_name
* "2. Acciones":#actions
** "2.1 Agregar nueva calidad":#a_add
** "2.2 Editar calidad existente":#a_edit
** "2.3. Ver calidad existente":#a_show
** "2.4. Eliminar calidad existente":#a_delete
* "3. Preguntas Frecuentes":#faq
</div>

<div class="contentHelp">
h2(#description). Descripción de los Campos

h3(#f_name). Nombre:

<div class="contentHelp">
Campo que almacena el nombre de la calidad.
</div>

h2(#actions). Acciones

h3(#a_add). Agregar nueva calidad:

<div class="textContent">
Para agregar una nueva calidad, primero debemos seleccionar el módulo "Calidad" en la barra de navegación (a la izquierda), ubicada dentro de "Recursos".
!/help/img/quality/add_1.png!
El Sistema mostrará en pantalla una lista de todos las calidades agregadas con anterioridad (Si se ha ingresado por primera vez, no mostrará ninguna).
Presionamos el botón "Nueva Calidad", en la esquina superior derecha.
!/help/img/quality/add_2.png!
Llenamos la información correspondiente (Los campos obligatorios se destacan con un *). Posteriormente guardamos para continuar o simplemente cancelamos.
!/help/img/quality/add_3.png!
Finalmente, el sistema volverá a la página principal de calidad y mostrará en la tabla la calidad agregada.
!/help/img/quality/add_4.png!
</div>

h3(#a_edit). Editar calidad existente:

<div class="textContent">
Para editar una calidad existente, en la página principal del módulo "Calidad", seleccionamos "Editar"
(ubicada al extremo opuesto de la calidad por editar y dentro de la columna "acciones").
!/help/img/quality/edit_1.png!
El Sistema cargará el formulario de ingreso, pero esta vez mostrará los datos que ya se han ingresado. En este punto se puede modificar la información de dichos campos o no.
Marcamos en el botón "Guardar" para confirmar los nuevos cambios o simplemente cancelamos.
!/help/img/quality/edit_2.png!
Finalmente, el sistema volverá a la página principal de calidad y mostrará en la tabla el o los datos modificados.
!/help/img/quality/edit_3.png!
</div>

h3(#a_show). Ver calidad existente:

<div class="textContent">
Para ver los datos de una calidad existente, en la página principal del módulo "Calidad", seleccionamos "Ver"
(ubicada al extremo opuesto de la calidad por ver y dentro de la columna "acciones"). 
!/help/img/quality/show_1.png!
El Sistema mostrará los datos de la calidad seleccionada, sin opción de modificación. Además, listará los productores pertenecientes a dicha calidad en la tabla (en caso de tener).
Por lo demás, en este punto, el sistema permite editar los datos o simplemente volver a la página principal del módulo.
!/help/img/quality/show_2.png!
Finalmente, el sistema volverá a la página principal de calidad o de edición dependiendo de la acción tomada.!
</div>

h3(#a_delete). Eliminar calidad existente:

<div class="textContent">
Para eliminar los datos de una calidad existente, en la página principal del módulo "Calidad", seleccionamos "Eliminar"
(ubicada al extremo opuesto de la calidad por eliminar y dentro de la columna "acciones"). 
!/help/img/quality/delete_1.png!
El Sistema mostrará un dialogo preguntando si deseamos eliminar la calidad.
!/help/img/quality/delete_2.png!
Si marcamos el botón "Aceptar", la calidad desaparecerá de la lista de calidades.
!/help/img/grouping/delete_3.png!
</div>

h2(#faq). Preguntas Frecuentes

Actualmente no existen preguntas frecuentes.
</div>')
		WikiPage.create(:creator_id => 1, :updator_id => 1, 
    				:path=> 'Destinos', :title => 'Destinos', :content => '<div class="textContent">
Módulo encargado de mantener los destinos. Permite agregar, modificar, habilitar/deshabitar y eliminar cada una de los destinos.
</div>


<div class="indexHelp">
* "1. Descripción de los Campos":#description
** "1.1 Rut":#f_rut
** "1.2 Nombre":#f_name
** "1.3 Región":#f_region
** "1.4 Comuna":#f_commune
** "1.5 Dirección":#f_address
** "1.5 E-Mail":#f_email
** "1.6 Contacto":#f_contact
** "1.7 Teléfono":#f_phone
* "2. Acciones":#actions
** "2.1 Agregar nuevo destino":#a_add
** "2.2 Editar destino existente":#a_edit
** "2.3. Ver destino existente":#a_show
** "2.4. Habilitar/Deshabilitar destino existente":#a_disable
** "2.5. Eliminar destino existente":#a_delete
* "3. Preguntas Frecuentes":#faq
</div>

<div class="contentHelp">
h2(#description). Descripción de los Campos

h3(#f_rut). Rut:

<div class="contentHelp">
Campo que almacena el Rut de la compañía de destino.
</div>

h3(#f_name). Nombre:

<div class="contentHelp">
Campo que almacena el nombre de la compañía de destino.
</div>

h3(#f_region). Región:

<div class="contentHelp">
Campo que almacena la región de compañía de destino.
</div>

h3(#f_commune). Comuna:

<div class="contentHelp">
Campo que almacena la comuna de compañía de destino.
</div>

h3(#f_address). Dirección:

<div class="contentHelp">
Campo que almacena la dirección de la compañía de destino.
</div>

h3(#f_email). E-Mail:

<div class="contentHelp">
Campo que almacena el E-Mail de la compañía de destino.
</div>

h3(#f_contact). Contacto:

<div class="contentHelp">
Campo que almacena el contacto de la compañía de destino.
</div>

h3(#f_phone). Teléfono:

<div class="contentHelp">
Campo que almacena el teléfono de la compañía de destino.
</div>

h2(#actions). Acciones

h3(#a_add). Agregar nuevo destino:

<div class="textContent">
Para agregar un nuevo destino, primero debemos seleccionar el módulo "Destinos" en la barra de navegación (a la izquierda), ubicada dentro de "Recursos".
!/help/img/destination/add_1.png!
El Sistema mostrará en pantalla una lista de todos los destinos agregadas con anterioridad (Si se ha ingresado por primera vez, no mostrará ninguno).
Presionamos el botón "Nuevo Destino", en la esquina superior derecha.
!/help/img/destination/add_2.png!
Llenamos la información correspondiente (Los campos obligatorios se destacan con un *). Posteriormente guardamos para continuar o simplemente cancelamos.
!/help/img/destination/add_3.png!
Finalmente, el sistema volverá a la página principal de destinos y mostrará en la tabla el destino agregado.
!/help/img/destination/add_4.png!
</div>

h3(#a_edit). Editar destinos existente:

<div class="textContent">
Para editar un destino existente, en la página principal del módulo "Destinos", seleccionamos "Editar"
(ubicada al extremo opuesto de el destino por editar y dentro de la columna "acciones").
!/help/img/destination/edit_1.png!
El Sistema cargará el formulario de ingreso, pero esta vez mostrará los datos que ya se han ingresado. En este punto se puede modificar la información de dichos campos o no.
Marcamos en el botón "Guardar" para confirmar los nuevos cambios o simplemente cancelamos.
!/help/img/destination/edit_2.png!
Finalmente, el sistema volverá a la página principal de destinos y mostrará en la tabla el o los datos modificados.
!/help/img/destination/edit_3.png!
</div>

h3(#a_show). Ver destinos existente:

<div class="textContent">
Para ver los datos de un destino existente, en la página principal del módulo "Destinos", seleccionamos "Ver"
(ubicada al extremo opuesto de el destino por ver y dentro de la columna "acciones"). 
!/help/img/destination/show_1.png!
El Sistema mostrará los datos de el destino seleccionado, sin opción de modificación.
Por lo demás, en este punto, el sistema permite editar los datos o simplemente volver a la página principal del módulo.
!/help/img/destination/show_2.png!
Finalmente, el sistema volverá a la página principal de destino o de edición dependiendo de la acción tomada.!
</div>

h3(#a_disable). Habilitar/Deshabilitar destino existente: 

<div class="textContent">
Para deshabilitar los datos de un destino existente, en la página principal del módulo "Destinos" y tabla "Habitados", seleccionamos "Deshabilitar"
(ubicada al extremo opuesto del destino por deshabilitar y dentro de la columna "acciones"). 
!/help/img/destination/disable_1.png!
El Sistema mostrará el destino en la sección de deshabilitados.
!/help/img/destination/disable_2.png!
</div>
(Para volver habilitar el destino, se hace el mismo procedimiento)

h3(#a_delete). Eliminar destino existente:

<div class="textContent">
(Una vez deshabilitado un destino)
Para eliminar los datos de un destino existente, en la página principal del módulo "Destinos" y tabla "Deshabilitados", seleccionamos "Eliminar"
(ubicada al extremo opuesto del destino por eliminar y dentro de la columna "acciones"). 
!/help/img/destination/delete_1.png!
El Sistema mostrará un dialogo preguntando si deseamos eliminar el destino.
!/help/img/destination/delete_2.png!
Si marcamos el botón "Aceptar", el destino desaparecerá de la lista de destinos.
</div>

h2(#faq). Preguntas Frecuentes

Actualmente no existen preguntas frecuentes.
</div>')
		WikiPage.create(:creator_id => 1, :updator_id => 1, 
    				:path=> 'Envases', :title => 'Envases', :content => '<div class="textContent">
Módulo encargado de mantener los envases. Permite agregar, modificar y eliminar cada uno de los envases.
</div>


<div class="indexHelp">
* "1. Descripción de los Campos":#description
** "1.1 Nombre":#f_name
** "1.2 Tara":#f_tara
* "2. Acciones":#actions
** "2.1 Agregar nuevo envase":#a_add
** "2.2 Editar envase existente":#a_edit
** "2.3. Ver envase existente":#a_show
** "2.4. Eliminar envase existente":#a_delete
* "3. Preguntas Frecuentes":#faq
</div>

<div class="contentHelp">
h2(#description). Descripción de los Campos

h3(#f_name). Nombre:

<div class="contentHelp">
Campo que almacena el nombre de el envase.
</div>

h3(#f_tara). Tara:

<div class="contentHelp">
Campo que almacena el kilogramo (kg) de la tara.
</div>


h2(#actions). Acciones

h3(#a_add). Agregar nuevo envase:

<div class="textContent">
Para agregar un nuevo envase, primero debemos seleccionar el módulo "Envase" en la barra de navegación (a la izquierda), ubicada dentro de "Recursos".
!/help/img/pack_type/add_1.png!
El Sistema mostrará en pantalla una lista de todos los envases agregados con anterioridad (Si se ha ingresado por primera vez, no mostrará ninguna).
Presionamos el botón "Nuevo Envase", en la esquina superior derecha.
!/help/img/pack_type/add_2.png!
Llenamos la información correspondiente (Los campos obligatorios se destacan con un *). Posteriormente guardamos para continuar o simplemente cancelamos.
!/help/img/pack_type/add_3.png!
Finalmente, el sistema volverá a la página principal de envases y mostrará en la tabla los envases agregados.
!/help/img/pack_type/add_4.png!
</div>

h3(#a_edit). Editar Envase existente:

<div class="textContent">
Para editar un envase existente, en la página principal del módulo "Envases", seleccionamos "Editar"
(ubicada al extremo opuesto de el envase por editar y dentro de la columna "acciones").
!/help/img/pack_type/edit_1.png!
El Sistema cargará el formulario de ingreso, pero esta vez mostrará los datos que ya se han ingresado. En este punto se puede modificar la información de dichos campos o no.
Marcamos en el botón "Guardar" para confirmar los nuevos cambios o simplemente cancelamos.
!/help/img/pack_type/edit_2.png!
Finalmente, el sistema volverá a la página principal de envases y mostrará en la tabla el o los datos modificados.
</div>

h3(#a_show). Ver envase existente:

<div class="textContent">
Para ver los datos de un envase existente, en la página principal del módulo "Envase", seleccionamos "Ver"
(ubicada al extremo opuesto de el envase por ver y dentro de la columna "acciones"). 
!/help/img/pack_type/show_1.png!
El Sistema mostrará los datos de el envase seleccionado, sin opción de modificación.
Por lo demás, en este punto, el sistema permite editar los datos o simplemente volver a la página principal del módulo.
!/help/img/pack_type/show_2.png!
Finalmente, el sistema volverá a la página principal de envases o de edición dependiendo de la acción tomada.
</div>

h3(#a_delete). Eliminar envase existente:

<div class="textContent">
Para eliminar los datos de un envase existente, en la página principal del módulo "Envase", seleccionamos "Eliminar"
(ubicada al extremo opuesto de el envase por eliminar y dentro de la columna "acciones"). 
!/help/img/pack_type/delete_1.png!
El Sistema mostrará un dialogo preguntando si deseamos eliminar el envase.
!/help/img/pack_type/delete_2.png!
Si marcamos el botón "Aceptar", el envase desaparecerá de la lista de envases.
!/help/img/pack_type/delete_3.png!
</div>

h2(#faq). Preguntas Frecuentes

Actualmente no existen preguntas frecuentes.
</div>')
		WikiPage.create(:creator_id => 1, :updator_id => 1, 
    				:path=> 'Productores', :title => 'Productores', :content => '<div class="textContent">
Módulo encargado de mantener los productores. Permite agregar, modificar, habilitar/deshabitar y eliminar cada una de los productores.
</div>

<div class="indexHelp">
* "1. Descripción de los Campos":#description
** "1.1 Rut":#f_rut
** "1.2 Nombre":#f_name
** "1.2 Giro":#f_line_of_business
** "1.3 Región":#f_region
** "1.4 Comuna":#f_commune
** "1.5 Dirección":#f_address
** "1.5 E-Mail":#f_email
** "1.7 Teléfono":#f_phone
** "1.8 Contacto":#f_contact
** "1.9 Código SAG":#f_sag_code
** "1.9 Código":#f_code
** "1.1.1 Agrupaciones":#f_code
* "2. Acciones":#actions
** "2.1 Agregar nuevo productor":#a_add
** "2.2 Editar productor existente":#a_edit
** "2.3. Ver productor existente":#a_show
** "2.4. Habilitar/Deshabilitar productor existente":#a_disable
** "2.5. Eliminar productor existente":#a_delete
* "3. Preguntas Frecuentes":#faq
** "3.1. ¿Por qué no aparecen agrupaciones para asociar?":#faq_1
</div>

<div class="contentHelp">
h2(#description). Descripción de los Campos

h3(#f_rut). Rut:

<div class="contentHelp">
Campo que almacena el Rut de el productor.
</div>

h3(#f_name). Nombre:

<div class="contentHelp">
Campo que almacena el nombre de el productor.
</div>

h3(#f_line_of_business). Giro:

<div class="contentHelp">
Campo que almacena el giro de el productor.
</div>

h3(#f_region). Región:

<div class="contentHelp">
Campo que almacena la región de el productor.
</div>

h3(#f_commune). Comuna:

<div class="contentHelp">
Campo que almacena la comuna de el productor.
</div>

h3(#f_address). Dirección:

<div class="contentHelp">
Campo que almacena la dirección de el productor.
</div>

h3(#f_email). E-Mail:

<div class="contentHelp">
Campo que almacena el E-Mail de el productor.
</div>

h3(#f_phone). Teléfono:

<div class="contentHelp">
Campo que almacena el teléfono de el productor.
</div>

h3(#f_contact). Contacto:

<div class="contentHelp">
Campo que almacena el contacto de el productor.
</div>

h3(#f_contact). Código SAG:

<div class="contentHelp">
Campo que almacena el código SAG de el productor.
</div>

h3(#f_contact). Código:

<div class="contentHelp">
Campo que almacena el código asociado de el productor.
</div>

h3(#f_contact). Agrupaciones:

<div class="contentHelp">
Campo que almacena el o las agrupaciones relacionadas a un productor.
</div>

h2(#actions). Acciones

h3(#a_add). Agregar nuevo productor:

<div class="textContent">
Para agregar un nuevo productor, primero debemos seleccionar el módulo "Productor" en la barra de navegación (a la izquierda), ubicada dentro de "Recursos".
!/help/img/producer/add_1.png!
El Sistema mostrará en pantalla una lista de todos los productores agregadas con anterioridad (Si se ha ingresado por primera vez, no mostrará ninguno).
Presionamos el botón "Nuevo Productor", en la esquina superior derecha.
!/help/img/producer/add_2.png!
Llenamos la información correspondiente (Los campos obligatorios se destacan con un *). Posteriormente guardamos para continuar o simplemente cancelamos.
(Cabe señalar, el sistema no mostrará "Agrupaciones" cuando no han sido creadas de forma previa) 
!/help/img/producer/add_3.png!
Finalmente, el sistema volverá a la página principal de productores y mostrará en la tabla el productor agregado.
!/help/img/producer/add_4.png!
</div>

h3(#a_edit). Editar productores existente:

<div class="textContent">
Para editar un productor existente, en la página principal del módulo "Productores", seleccionamos "Editar"
(ubicada al extremo opuesto de el productor por editar y dentro de la columna "acciones").
!/help/img/producer/edit_1.png!
El Sistema cargará el formulario de ingreso, pero esta vez mostrará los datos que ya se han ingresado. En este punto se puede modificar la información de dichos campos o no.
Marcamos en el botón "Guardar" para confirmar los nuevos cambios o simplemente cancelamos.
!/help/img/producer/edit_2.png!
Finalmente, el sistema volverá a la página principal de productores y mostrará en la tabla el o los datos modificados.
!/help/img/producer/edit_3.png
</div>

h3(#a_show). Ver productores existente:

<div class="textContent">
Para ver los datos de un productor existente, en la página principal del módulo "Productores", seleccionamos "Ver"
(ubicada al extremo opuesto de el productor por ver y dentro de la columna "acciones"). 
!/help/img/producer/show_1.png!
El Sistema mostrará los datos de el productor seleccionado, sin opción de modificación.
Por lo demás, en este punto, el sistema permite editar los datos o simplemente volver a la página principal del módulo.
!/help/img/destination/show_2.png!
Finalmente, el sistema volverá a la página principal de productor o de edición dependiendo de la acción tomada.!
</div>

h3(#a_disable). Habilitar/Deshabilitar productor existente: 

<div class="textContent">
Para deshabilitar los datos de un productor existente, en la página principal del módulo "Productores" y tabla "Habitados", seleccionamos "Deshabilitar"
(ubicada al extremo opuesto de el productor por deshabilitar y dentro de la columna "acciones"). 
!/help/img/producer/disable_1.png!
El Sistema mostrará el productor en la sección de deshabilitados.
!/help/img/producer/disable_2.png!
</div>
(Para volver habilitar el productor, se hace el mismo procedimiento)

h3(#a_delete). Eliminar productor existente:

<div class="textContent">
(Una vez deshabilitado un productor)
Para eliminar los datos de un productor existente, en la página principal del módulo "Productores" y tabla "Deshabilitados", seleccionamos "Eliminar"
(ubicada al extremo opuesto de el productor por eliminar y dentro de la columna "acciones"). 
!/help/img/producer/delete_1.png!
El Sistema mostrará un dialogo preguntando si deseamos eliminar el productor.
!/help/img/producer/delete_2.png!
Si marcamos el botón "Aceptar", el productor desaparecerá de la lista de productores.
!/help/img/producer/delete_3.png!
</div>

h2(#faq). Preguntas Frecuentes

h3(#faq_1). ¿Por qué no aparecen agrupaciones para asociar al momento de crear un nuevo productor?

<div class="textContent">
El Sistema no mostrará agrupaciones que no estén creadas previamente.
!/help/img/faq/faq_1.png!

Paso 1: Seleccionar el Módulo "Agrupaciones".
!/help/img/faq/faq_2.png!

Paso 2: Verificar existencia de "Agrupaciones" previas.
!/help/img/faq/faq_3.png!

Paso 3: Crear una nueva "Agrupación".
!/help/img/faq/faq_4.png!

Paso 4: Una vez creada la nueva agrupación, volver a crear un nuevo "Productor" y seleccionar la "Agrupación" recientemente creada.
!/help/img/faq/faq_5.png!
</div>
</div>')
	end
end
