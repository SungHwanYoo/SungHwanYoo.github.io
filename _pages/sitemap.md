---
layout: single
title: "Sitemap"
permalink: /sitemap/
author_profile: true
---

## Pages

{% for link in site.data.navigation.main %}
- [{{ link.title }}]({{ link.url | relative_url }})
{% endfor %}

## Publications

{% for paper in site.publications reversed %}
- [{{ paper.title }}]({{ paper.url | relative_url }})
{% endfor %}

## Projects

{% assign projects = site.portfolio | sort: 'order' %}
{% for project in projects %}
- [{{ project.title }}]({{ project.url | relative_url }})
{% endfor %}
