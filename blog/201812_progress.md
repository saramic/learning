# Progress Dec 2018

* Mon 3rd
  - convert m4a to mp3 using ffmpeg
    via https://gist.github.com/christofluethi/646ae60d797a46a706a5
    ```
    ffmpeg out.mp3 -i in.m4a -codec:a libmp3lame -qscale:a 1
    ```

