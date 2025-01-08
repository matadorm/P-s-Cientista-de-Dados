import scrapy


class ColetanoticiaSpider(scrapy.Spider):
    name = "coletanoticia"
    allowed_domains = ["https://web.archive.org/web/20210319135553/https://www1.folha.uol.com.br/"]
    start_urls = ["https://web.archive.org/web/20210319135553/https://www1.folha.uol.com.br/ultimas-noticias/"]

    def parse(self, response):
        pass


#todos os titulos: response.css(".c-headline__title , .c-main-headline__title").getall()
#subtitulos: response.css(".c-headline__standfirst , .c-main-headline__standfirst").getall()
#datas: response.css(".c-headline__dateline").getall()