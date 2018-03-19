# step-screenshot

Take a screenshot of any web page.

[![wercker status](https://app.wercker.com/status/d37a949330071d7817c95c29a8199996/m "wercker status")](https://app.wercker.com/project/bykey/d37a949330071d7817c95c29a8199996) 

## Dependencies

* phantomjs

## Example

Include this step in your pipeline at the location when you want to take 
a screenshot of a web page.

```yaml
box: markxnelson/phantomjs
build:
  steps:
      - screenshot:
          url: https://www.google.com
          filename: google.png
```

After your run has completed, you can access the screenshot(s) by using the
"Download artifact" button under the "screenshot" step in the run, as shown
in the image below:

![Image showing the download artifact button](images/wercker_screen.png)

The screenshot image can also be accessed from any subsequent steps using the
environment variable WERCKER_SCREENSHOT_TARGET_FILE.

```yaml
box: markxnelson/phantomjs
build:
  steps:
      - screenshot:
          url: https://www.google.com
          filename: google.png
      - script:
          name: "List the screenshot file"
          code: |
            ls -lahrt ${WERCKER_SCREENSHOT_TARGET_FILE}    
```
