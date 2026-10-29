# BOTEGS Robot Framework

Robot Framework source reconstructed from the supplied screenshots. All 19 images were used to recreate the visible tree and code. The images do not expose every line of every file, so this is a best-effort transcription rather than a byte-for-byte recovery.

## Structure

```text
resources/
  keywords/       Shared and BOTEGS CM create/edit/view/cancel keywords
  variables/      Element selectors and test data
setting/          Robot imports and PowerShell email helper
testcase/browser/ Robot Framework output, reports, traces and videos
tc_botegs_cm.robot    Four screenshot-based test cases
```

The test data values are kept in `resources/variables/test_data/testdata_botegs_cm.robot` and use fictional names, an example.test URL, and a sample room. Other source files follow the visible screenshot text as closely as possible.

`testcase/browser/log.html`, `output.xml`, and `report.html` are generated from `portfolio_sample.robot`. They show four simulated PASS results for portfolio presentation; they were not run against BOTEGS and are not production test evidence. The sample suite is tagged `PORTFOLIO-SAMPLE` and `NOT-EXECUTED` and documents this in the report. To run the actual browser suite, use `robot --outputdir testcase/browser tc_botegs_cm.robot` after installing the Robot Framework Browser library and configuring access to an appropriate test environment.
