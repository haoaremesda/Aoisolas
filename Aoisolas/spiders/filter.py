import scrapy
from scrapy.spiders import CrawlSpider
from ..items import AoisolasItem
from hashlib import md5
import re


class FilterSpider(CrawlSpider):
    name = 'netbian'
    allowed_domains = ['www.netbian.com']
    start_urls = ['http://www.netbian.com/mei/index.htm']

    def start_requests(self):
        for url in self.start_urls:
            yield scrapy.Request(url=url, callback=self.parse_item)

    def parse_item(self, response):
        img_list = response.xpath('//div[@id="main"]/div[@class="list"]//li[not(@class)]/a').extract()
        for s in img_list:
            item = AoisolasItem()
            item['name'] = re.findall(r'title="(.+?)"', s)[0]
            item['img_url'] = re.findall(r'src="(.+?)"', s)[0]
            item['md5_url'] = md5(item['img_url'].encode()).hexdigest()
            yield item
        max_page_number = int(response.xpath('//div[@class="page"]/a[last()-1]/text()').get())
        for num in range(2, max_page_number):
            yield response.follow(f"http://www.netbian.com/mei/index_{num}.htm", callback=self.parse_item)

