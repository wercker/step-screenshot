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

**Changes in 1.1.1 release**

Location of generated screenshot is decided as follows:
* filename: Contains File name only, create_file_in_artifacts: false - Creates screenshot at top level in the source directory
* filename: Contains File name only, create_file_in_artifacts: true - Creates screenshot at top level in the artifatcs directory
* filename: Contains absolute path of file, create_file_in_artifacts: false - Creates screenshot at an absolute path in the box
* filename: Contains relative path of file, create_file_in_artifacts: false - Creates screenshot at an relative path to source directory
* filename: Contains relative path of file, create_file_in_artifacts: true - Creates screenshot at an relative path to the artifacts directory
* filename: Contains absolute path of file, create_file_in_artifacts: true - Creates screenshot at an relative path to the artifacts directory (Leading forward / in the path is ignored)

For a working example, please see https://github.com/lake-of-dreams/screenshot-sample.

## Contributing to this repository 

Oracle welcomes contributions to this repository from anyone.  Please see [CONTRIBUTING](CONTRIBUTING.md) for more information. 
