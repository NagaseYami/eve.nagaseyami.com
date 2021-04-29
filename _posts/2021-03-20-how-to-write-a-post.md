---
title: 如何撰写Post
date: 2021-03-20 23:11:00 +0900
categories: [学习]
tags: [chirpy, jekyll]
---

在使用jekyll的chirpy主题时如何撰写Post  
主要是写给自己用的Cheat Sheet，毕竟等到要用的时候再去查资料实在是太慢了  

## 最小构成

1. 文件名必须为`YYYY-MM-DD-TITLE.EXTENSION`
    - `EXTENSION`必须为`md`或者`markdown`
1. 必须在文件开头写好以下Front Matter

```yaml
---
title: TITLE
date: YYYY-MM-DD HH:MM:SS +/-TTTT   # e.g. 2021-01-01 08:30:00 +0800
categories: [TOP_CATEGORIE, SUB_CATEGORIE]  # 最多支持2个分类，前者为主分类后者为次分类
tags: [TAG]     # TAG names 是英文时应该为小写
---
```

## 可选

### 目录

是否需要显示目录，默认选项可以在`_config.yml`里修改，如需更改则将以下内容添加至Front Matter即可  

```yaml
---
toc: false
---
```

### 评论

和目录一样，默认选项可以在`_config.yml`里修改，如需更改则将以下内容添加至Front Matter即可  

```yaml
---
comments: false
---
```

### 数学表达式

出于性能原因，默认关闭，如需启动则将以下内容添加至Front Matter即可  

```yaml
---
math: true
---
```

### Mermaid 图表

非常方便的图标生成器，支持各种图表的生成，具体参考[Mermail的Github](https://github.com/mermaid-js/mermaid)  
默认关闭，如需启动则将以下内容添加至Front Matter即可  

```yaml
---
mermaid: true
---
```

使用时用Markdown的Code Block写法并指定语言为mermaid即可  

### Post预览图

将以下内容添加至Front Matter即可  

```yaml
---
image:
  src: /path/to/image/file
  alt: image alternative text
---
```

### 图片标题

在普通图片的Markdown写法的下一行用斜体写上标题即可  

```markdown
![img-description](/path/to/image)
_Image Caption_
```

### 图片调整

调整大小  

```markdown
![img-description](/path/to/image){: width="400"}
```

调整对齐  

```markdown
![img-description](/path/to/image){: .normal}
![img-description](/path/to/image){: .left}
![img-description](/path/to/image){: .right}
```

### Post置顶

可以置顶多条Post，它们会按照date的从新到旧的顺序显示在顶端  

```yaml
pin: true
```

### Liquid Code

需要用`{{ "{% raw " }}%}`和`{{ "{% endraw " }}%}`框住  

````liquid
{{ "{% raw " }}%}
{% raw %}
```liquid
{% if product.title contains 'Pack' %}
  This product's title contains the word Pack.
{% endif %}
```
{% endraw %}
{{ "{% endraw " }}%}
````

## 参考文献

[chirpy: Writing a new post](https://github.com/cotes2020/jekyll-theme-chirpy/wiki/Writing-a-new-post)  
[jekyll: Posts](https://jekyllrb.com/docs/posts/)  
[jekyll: Front Matter](https://jekyllrb.com/docs/front-matter/)  
[rouge: List of supported languages and lexers](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers)  
