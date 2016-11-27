---

date: 2015-01-01
description: "Una nueva website estática"
excerpt: "Si bien es cierto que otras herramientas permiten montar una website en un tiempo mínimo, he optado por usar Hugo como herramienta para generacion estática de sitios programada en Go."
title: Renovarse o morir
type: post
tags: [devs, hugo, golang, static, site, generator]

---

Es cierto que otras herramientas permiten montar una website en un tiempo mínimo y *medido en clicks*, pero yo he optado por usar un [generador de sitios estáticos][1]. El hecho que haya elegido [Hugo][2] y no otro, entre [decenas de posibles opciones][3], viene condicionado principalmente por 4 factores

1. seguridad,
2. tiempo de respuesta,
3. principio [kiss][4] y,
4. me considero un *gopher[^5]*.

## Seguridad

Si bien [WordPress][6] me parece una magnífica plataforma, para algo simple como una [site mas un blog][7] me basta un simple alojamiento para contenido estático, ya que: me ahorro dinero, menos complejo de mantener para mí y no necesito disponer de lo que un hosting conlleva (DB, php/python/...).

Aunque una de las razones fundamentales es la seguridad. Tener que estar pendiente de actualizar la plataforma y de sus pertinentes [fallos][8] para mi propia site se me antoja tedioso; en los hostings mas populares, la opción [1-click][9] permite que se auto actualicen las versiones generandote cierto trabajo al tener que mantener tus plantillas/plugins al día.

## Tiempo de respuesta

Dejando a un lado javascript, el cual siempre toma parte en el asunto, el hecho de estar servido estaticamente aligera de facto las cosas.

Evidentemente, el tiempo arriba mostrado no contempla los [estados 304][10]. Aunque puedes conseguir un efecto similar en diferentes proveedores de hosting usando sus propios sistemas de cache e/o instalando plugins en WordPress.

## Principio kiss

> "Ahhhhhhh, Migueeeel!!!  
> "¿Que te pasa ahora Fulanito?"  
> "Mi template hace cosas raras al renderizar... :(. Yo solo he actualizado wordpress"  
> "Jódete..."  

He de reconocer que es algo subjetivo decir que, en mi caso, aplicar *kiss* es usar un generador de contenido estático. Aunque en última instancia, lo único que quiero es no tener que prestar atención a nada más que escribir nuevo contenido o retocar el diseño de mi página web.

Solo tengo que bajar el código, tanto para desarrollar como para poner en producción y ejecutar un par de comandos
``` sh
hg clone https://bitbucket.org/linecode30/website
cd website
rm -Rf public/
hugo server -v true -D true --verboseLog=true -b localhost -p 9000 --watch &
```

Y ejecutar esto en el caso de generar el contenido para producción
``` c++
int main(int args, char **argv) {
  std::cout << "hello world" << std::endl;
  return 0;
}
```

El contenido generado que hay en `public` es lo único que tengo que subir, mediante ftp o rsync[^11], a mi proveedor de hosting.

## Go y el amor a primera vista

Lo siento, es amor. Así que no tengo que justificarlo :D. Existen verdaderas parrafadas sobre las ventajas de usar [Go][12] en el lado del servidor en lugar de muchas otras alternativas. Posiblemente en algún otro momento escriba detalladamente sobre el tema.

De todos modos aquí os dejo [un par][13] de [posts][14] sobre el tema y las palabras de **Rob Pike** de [una charla][15].

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
[10]: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes#3xx_Redirection
[^11]: En el supuesto que tu proveedor de hosting permita rsync, podrás ahorrar tiempo y optimizar los ficheros a subir. Especialmente útil para blogs con un elevado número de posts.
[12]: https://tour.golang.org/welcome/1
[13]: http://jordanorelli.com/post/31533769172/why-i-went-from-python-to-go-and-not-node-js
[14]: http://npf.io/2014/10/why-everyone-hates-go/
[15]: https://talks.golang.org/2012/splash.article
