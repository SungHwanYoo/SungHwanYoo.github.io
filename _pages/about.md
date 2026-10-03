---
permalink: /
title: "Sunghwan Yoo"
author_profile: true
classes: personal-home
excerpt: "Sunghwan Yoo researches infrared–visible image fusion (IVIF) and image deblurring at CVIP Lab, Gachon University."
redirect_from:
  - /about/
  - /about.html
---

<div class="intro-block" markdown="1">
<p class="eyebrow">M.S. Student · CVIP Lab · Gachon University</p>

I received my **B.S. degree** from the School of Computing at Gachon University, Seongnam, South Korea, in 2026.

<p class="education-details">GPA: <strong>4.47 / 4.50</strong> · Major GPA: <strong>4.50 / 4.50</strong></p>

I am currently a master's student in the **School of Computing** at Gachon University and a member of the [Computer Vision and Image Processing Laboratory (CVIP Lab)](https://sites.google.com/site/gachoncvip).

My research interests include **infrared–visible image fusion (IVIF)** and **image restoration**.

<div class="profile-actions">
  <a class="profile-button" href="{{ '/publications/' | relative_url }}">Publications <span aria-hidden="true">↗</span></a>
  <a class="profile-button profile-button--secondary" href="{{ '/cv/' | relative_url }}" data-cv-open aria-haspopup="dialog" aria-controls="cv-preview">CV</a>
</div>
</div>

<section class="ivif-section" aria-labelledby="ivif-heading">
  <h2 id="ivif-heading">Infrared–visible image fusion (IVIF)</h2>
  <p>Infrared images capture thermal information, while visible images provide color, texture, and scene structure.</p>

  <p>Fusion combines these complementary views into a single image. In the example below, it preserves the person's thermal contrast alongside the surrounding visual detail.</p>

  <figure class="ivif-demo">
    <video width="1280" height="720" autoplay muted loop playsinline controls preload="metadata" poster="{{ '/assets/media/ivif-demo-poster.png' | relative_url }}" aria-label="Animation showing infrared and visible inputs combining into one fused image">
      <source src="{{ '/assets/media/ivif-demo.webm' | relative_url }}" type="video/webm">
      <source src="{{ '/assets/media/ivif-demo.mp4' | relative_url }}" type="video/mp4">
      <img src="{{ '/assets/media/ivif-demo-poster.png' | relative_url }}" alt="Two inputs, an infrared image showing thermal targets and a visible image showing scene detail, combine into a fused result." width="1280" height="720">
    </video>
  </figure>
</section>

<section class="deblurring-section" aria-labelledby="deblurring-heading">
  <h2 id="deblurring-heading">Two-stage image deblurring</h2>
  <p>Image deblurring recovers a sharper image from a blurred observation. Here, the first stage produces an initial restoration, which the second stage refines.</p>

  <p>The example below shows this progression on a blurred sign. Compare the dog's outline and the leash from the input to the final result.</p>

  <figure class="deblurring-demo">
    <video width="960" height="720" autoplay muted loop playsinline controls preload="metadata" poster="{{ '/assets/media/deblurring-owner-figure-poster.png' | relative_url }}" aria-label="Animation of a blurred dog-and-person sign changing from input to Stage 1 and the final Stage 2 result">
      <source src="{{ '/assets/media/deblurring-owner-figure-demo.webm' | relative_url }}" type="video/webm">
      <source src="{{ '/assets/media/deblurring-owner-figure-demo.mp4' | relative_url }}" type="video/mp4">
      <img src="{{ '/assets/media/deblurring-owner-figure-poster.png' | relative_url }}" alt="The two-stage deblurring pipeline above a restored dog, its leash, and the person holding it." width="960" height="720">
    </video>
  </figure>
</section>
