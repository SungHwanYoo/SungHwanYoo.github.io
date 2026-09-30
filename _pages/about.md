---
permalink: /
title: "Sunghwan Yoo"
author_profile: true
classes: personal-home
excerpt: "M.S. student at CVIP Lab, Gachon University, researching image fusion, restoration, and 3D vision."
redirect_from:
  - /about/
  - /about.html
---

<div class="intro-block" markdown="1">
<p class="eyebrow">M.S. Student · CVIP Lab · Gachon University</p>
<p class="intro-lead">Image fusion, restoration<br class="desktop-break"> &amp; 3D vision.</p>

I am a master's student in **Artificial Intelligence** at Gachon University and a member of the [Computer Vision & Image Processing (CVIP) Lab](https://sites.google.com/site/gachoncvip). My research focuses on infrared–visible image fusion and image deblurring, with interests in event-based vision and 3D reconstruction.

I enjoy connecting research ideas with working systems—from image restoration models to 3D web experiences and computer vision applications.

<div class="profile-actions">
  <a class="profile-button" href="{{ '/publications/' | relative_url }}">View publications <span aria-hidden="true">↗</span></a>
  <a class="profile-button profile-button--secondary" href="{{ '/cv/' | relative_url }}">Curriculum vitae</a>
</div>
</div>

<div class="research-topics" aria-label="Research interests">
  <span>Infrared–visible fusion</span><span>Image deblurring</span><span>Event-based vision</span><span>3D reconstruction</span>
</div>

## Selected work

<div class="project-grid">
{% assign featured_projects = site.portfolio | where: 'featured', true | sort: 'order' %}
{% for project in featured_projects %}
  <article class="project-card">
    <div class="project-card__mark" aria-hidden="true">{{ project.mark }}</div>
    <p class="eyebrow">{{ project.area }}</p>
    <h3><a href="{{ project.url | relative_url }}">{{ project.title }}</a></h3>
    <p>{{ project.summary }}</p>
    <a class="text-link" href="{{ project.url | relative_url }}">Explore project <span aria-hidden="true">→</span></a>
  </article>
{% endfor %}
</div>

<p class="section-link"><a href="{{ '/projects/' | relative_url }}">All projects &amp; research activities →</a></p>

## Recent highlights

<div class="highlights" markdown="1">
- **September 2026** — Started my M.S. studies in Artificial Intelligence at Gachon University.
- **August 2026** — Received an Encouragement Award (장려상) in the KCC undergraduate paper competition for work on infrared–visible image fusion.
- **August 2026** — Graduated first in my major, with an overall GPA of **4.47/4.5** and a major GPA of **4.5/4.5**.
</div>

<div class="contact-block" markdown="1">
### Let's connect

For research discussions, collaborations, or engineering opportunities, reach me at [dksl1233@gachon.ac.kr](mailto:dksl1233@gachon.ac.kr). You can also find me on [LinkedIn](https://www.linkedin.com/in/sunghwan-yoo-1328492b8/) and [GitHub](https://github.com/SungHwanYoo).
</div>
