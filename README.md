# step-screenshot

Take a screenshot of any web page.

[![wercker status](https://app.wercker.com/status/d37a949330071d7817c95c29a8199996/m "wercker status")](https://app.wercker.com/project/bykey/d37a949330071d7817c95c29a8199996) 

## Dependencies

* phantomjs

## Example

```yaml
box: cmfatih/phantomjs
build:
  steps:
      - screenshot:
          url: https://www.google.com
          filename: google.png
```
