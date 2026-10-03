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
demos:
  - title: "Cattle-tail detection & state classification"
    video: "/assets/media/cattle-tail-demo.mp4"
    poster: "/assets/media/cattle-tail-demo-poster.jpg"
    width: 800
    height: 400
    autoplay: true
    description: "Cattle-tail detection and raised or lowered tail-state predictions in barn CCTV footage."
---

{% include project-videos.html project=page %}

<p class="entry-period">February–March 2025</p>

A freelance computer vision project through Freemoa (프리모아), using barn CCTV footage to detect cattle-tail locations and distinguish raised and lowered tail states.

### My contribution

- Reviewed footage, redesigned labeling criteria, and expanded labeled training data.
- Analyzed false detections from barn structures, applied OpenCV-based augmentation, and tuned the YOLO model.
- Delivered an ONNX model for downstream integration.

[← All projects]({{ "/projects/" | relative_url }})
