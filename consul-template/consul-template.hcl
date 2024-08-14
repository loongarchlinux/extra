# This provides a minimal configuration
# See /usr/share/doc/consul-template for further examples

consul {
  address = "127.0.0.1:8500"

  auth {
    enabled = true
    username = "test"
    password = "test"
  }
}

log_level = "warn"

template {
  contents = "{{key \"hello\"}}"
  destination = "out.txt"
  exec {
    command = "cat out.txt"
  }
}
