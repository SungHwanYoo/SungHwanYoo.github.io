---
title: "CCTV cattle-tail detection"
collection: "portfolio"
permalink: "/projects/cattle-tail-detection/"
area: "Applied computer vision"
order: 5
featured: true
mark: "03"
summary: "Freemoa freelance project covering dataset review, labeling criteria, model training, error analysis, and ONNX delivery for cattle-tail detection and raised/lowered state classification."
tools: "YOLO · OpenCV · ONNX"
excerpt: "A YOLO-based detector and tail-state classification pipeline delivered as an ONNX model."
share: false
comments: false
period: "February–March 2025"
---

<p class="entry-period">February–March 2025</p>

A freelance computer vision project through Freemoa (프리모아), using barn CCTV footage to detect cattle-tail locations and distinguish raised and lowered tail states.

### Demo

<figure class="project-demo">
  <video width="800" height="400" autoplay muted loop playsinline controls preload="metadata" poster="{{ '/assets/media/cattle-tail-demo-poster.jpg' | relative_url }}" aria-label="Cattle-tail detection demo showing bounding boxes and lowered-tail state predictions in barn CCTV footage" aria-describedby="cattle-demo-caption">
    <source src="{{ '/assets/media/cattle-tail-demo.mp4' | relative_url }}" type="video/mp4">
    <img src="{{ '/assets/media/cattle-tail-demo-poster.jpg' | relative_url }}" alt="Two cattle tails detected with bounding boxes and Down state labels." width="800" height="400">
  </video>
  <figcaption id="cattle-demo-caption">Tail detection and state classification in barn CCTV footage.</figcaption>
</figure>

### My contribution

- Reviewed footage, redesigned labeling criteria, and expanded labeled training data.
- Analyzed false detections from barn structures, applied OpenCV-based augmentation, and tuned the YOLO model.
- Delivered an ONNX model for downstream integration.

[← All projects]({{ "/projects/" | relative_url }})
