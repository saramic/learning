# Pi Commpute

## Submission

> This road test will build a real-world AI-powered smart pet feeder system
> using the CM5 as the embedded compute platform. The project involves two
> feeding stations
>
> 1. one for dogs,
> 2. one for a cat
>
> each with a dedicated camera connected to the CM5's dual MIPI CSI ports. A
> Hailo-8L AI accelerator (via the CM5 IO board's M.2 slot that I will provide
> myself) will run three concurrent inference pipelines:
>
> 1. species classification (cat/dog/bird) - using YOLOv8
> 2. dog pose estimation to detect a "sit" before dispensing food, and - using
>    YOLOv8-pose model tuned on Ultralytics dog-pose dataset
> 3. cat proximity detection to prevent birds accessing the cat bowl.
>
> GPIO will drive stepper motors for food dispensing and a servo for the cat
> bowl lid. A web dashboard will provide live camera streams, feeding logs, and
> remote control
>
> The test will benchmark CM5 CPU-only inference vs Hailo-accelerated
> inference, measure GPIO latency, and assess suitability for embedded product
> deployment.

in detail -> [assets/SUBMISSION.pdf](assets/SUBMISSION.pdf)
