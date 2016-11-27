---

date: 2016-11-27
description: "Una nueva website estática"
excerpt: "Si bien es cierto que otras herramientas permiten montar una website en un tiempo mínimo, he optado por usar Hugo como herramienta para generacion estática de sitios programada en Go."
title: Website Estática
type: post
tags: [dev, hugo, golang, static, site, generator]

---

Es cierto que otras herramientas permiten montar una website en un tiempo mínimo y *medido en clicks*, pero yo he optado por usar un [generador de sitios estáticos][1]. El hecho que haya elegido [Hugo][2] y no otro, entre [decenas de posibles opciones][3], viene condicionado principalmente por 3 factores

1. seguridad,
2. tiempo de respuesta y,
3. principio [kiss][4].


## Seguridad

Si bien [WordPress][6] me parece una magnífica plataforma, para algo simple como una [site mas un blog][7] me basta un simple alojamiento para contenido estático, ya que: me ahorro dinero, menos complejo de mantener para mí y no necesito disponer de lo que un hosting conlleva (DB, php/python/...).

Aunque una de las razones fundamentales es la seguridad. Tener que estar pendiente de actualizar la plataforma y de sus pertinentes [fallos][8] para mi propia site se me antoja tedioso; en los _hostings_ mas populares, la opción [1-click][9] permite que se auto actualicen las versiones generandote cierto trabajo al tener que mantener tus plantillas/plugins al día.

## Tiempo de respuesta

Dejando a un lado javascript, el cual siempre toma parte en el asunto a la hora del renderizado final en el lado del cliente, el hecho de estar servido estaticamente aligera,de facto, las cosas.

En el caso de la necesidad de disponer de tu propio servicio, mi opción sería [NGINX][10] como servidor de contenido estático, aunque bueno, incluso para [contenido dinámico][16] es una de mis opciones preferidas. Aunque puedes conseguir un efecto similar en diferentes proveedores de hosting usando sus propios sistemas de cache e/o instalando plugins en WordPress.

## Principio kiss

> "Ahhhhhhh, Migueeeel!!!  
> "¿Que te pasa ahora Fulanito?"  
> "Mi template hace cosas raras al renderizar... :(. Yo solo he actualizado wordpress"  
> "Mi lo que tú decir, no entender..."  

He de reconocer que es algo subjetivo decir que, en mi caso, aplicar *kiss* es usar un generador de contenido estático. Aunque en última instancia, lo único que quiero es no tener que prestar atención a nada más que escribir nuevo contenido o retocar el diseño de mi página web.

Solo tengo que bajar el código, tanto para desarrollar como para poner en producción y ejecutar un par de comandos
``` sh
hg clone https://github.com/mkarmona/mkarmona.github.io-src
cd mkarmona.github.io-src
rm -Rf public/
hugo server -v true -D true --verboseLog=true -b localhost -p 9000 --watch &
```

Y ejecutar esto en el caso de generar el contenido para producción
``` sh
./prod.sh
```

El contenido generado que hay en `public` es lo único que tengo que subir, mediante ftp o rsync[^11], a mi proveedor de hosting.

## Go

Aún no cosiderandome un [_gopher_][^5] creo que **Go** es un _[game changer][17]_. Existen verdaderas parrafadas sobre las ventajas de usar [Go][12] en el lado del servidor en lugar de muchas otras alternativas. Posiblemente en algún otro momento escriba detalladamente sobre Go (pros y contras)[^18]. De todos modos aquí os dejo [un par][13] de [posts][14] sobre el tema y las palabras de **Rob Pike** de [una charla][15].

> Go's purpose is therefore not to do research into programming language design; it is to improve the working environment for its designers and their coworkers. Go is more about software engineering than programming language research.


[1]: http://gohugo.io
[2]: http://github.com/spf13/hugo
[3]: https://iwantmyname.com/blog/2014/05/the-updated-big-list-of-static-website-generators-for-your-site-blog-or-wiki.html
[4]: http://es.wikipedia.org/wiki/Principio_KISS
[^5]: A los integrantes de la comunidad de usuarios de Go (lenguage de Google creado por Thompson, Rob Pike y Robert Griesemer) se les conoce como *gophers*.
[6]: http://wordpress.org
[7]: http://linecode30.com
[8]: http://www.cvedetails.com/vulnerability-list/vendor_id-2337/product_id-4096/Wordpress-Wordpress.html
[9]: https://www.ovh.co.uk/web-hosting/website/
[10]: https://www.nginx.com/resources/admin-guide/serving-static-content/
[^11]: En el supuesto que tu proveedor de hosting permita rsync, podrás ahorrar tiempo y optimizar los ficheros a subir. Especialmente útil para blogs con un elevado número de posts.
[12]: https://tour.golang.org/welcome/1
[13]: http://jordanorelli.com/post/31533769172/why-i-went-from-python-to-go-and-not-node-js
[14]: http://npf.io/2014/10/why-everyone-hates-go/
[15]: https://talks.golang.org/2012/splash.article
[16]: https://www.nginx.com/blog/maximizing-python-performance-with-nginx-parti-web-serving-and-caching/
[17]: http://www.investopedia.com/terms/g/game-changer.asp
[^18]: ¡Todavía sin genericos!
