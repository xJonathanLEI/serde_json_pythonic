# serde_json_pythonic

`serde_json` fork that includes a Pythonic JSON formatter, which mimics output from the `json.dumps()` function in Python.

While it's indeed possible to create such a formatter without modifying `serde_json`, it only works when the `std` feature is enabled, as `serde_json` does not expose the types needed for the formatter implementation under `no_std` mode. This fork makes such a formatter built-in and also available in `no_std`.
