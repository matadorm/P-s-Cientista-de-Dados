import scrapy
import json

class Noticia(object):
    def __init__(self,nome, resumo,data):
        self.nome = self.clean(nome)
        self.resumo =  self.clean(resumo)
        self.data =  self.clean(data)
    #essa função serve para tirar espaços em branco
    def clean(self,texto):
        if texto:
            return texto.replace("\n","").strip()


class NoticiaFolhaSpider(scrapy.Spider):
    name = 'noticia_folha'
    allowed_domains = ['https://web.archive.org/web/20210319135553/https://www1.folha.uol.com.br']
    start_urls = ['https://web.archive.org/web/20210319135553/https://www1.folha.uol.com.br/ultimas-noticias/']
    noticias = []
    def parse(self, response):
        for noticia_site in response.xpath('//*[@id="conteudo"]/div[1]/div[2]/div/div/div[1]/div/div/div/ol'):         
            nome = noticia_site.css(".c-headline__title , .c-main-headline__title").get() # titulo da noticia
            resumo = noticia_site.css(".c-headline__standfirst , .c-main-headline__standfirst").get() # resumo da noticia
            data = noticia_site.css(".c-headline__dateline").get() #data da noticia
            noticia = Noticia(nome,resumo,data)
            print(noticia.__dict__)
            self.add(noticia)
        #função para salvar a notícia
        with open("noticias.json", "w",encoding='utf8') as file:
            json.dump([ob.__dict__ for ob in self.noticias],file,ensure_ascii=False)
            print(file)

    #verificação se a notícia está vazia e não adiciona na lista        
    def add(self,noticia):
        if (noticia.nome is None or noticia.resumo is None or noticia.data is None):
            return
        self.noticias.append(noticia)