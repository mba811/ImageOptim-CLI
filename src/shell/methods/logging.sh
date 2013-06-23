# ==============================================================================
# Logging
# ==============================================================================

# (): Display usage information
function usage {
{{usage}}
}

# (): Display usage examples
function examples {
{{examples}}
}

# ($1:message): Display a red error message and quit
function error {
  printf "\e[31m✘ $1"
  echo "\033[0m"
  exit 1
}

# ($1:message): Display a message in green with a tick by it
function success {
  printf "\e[32m✔ ${1}"
  echo "\033[0m"
}

# ($1:file, $2:logName)
function addFileSizeToLog {
  local key=$2
  local file=$1
  local size=$(sizeInBytes "$1")
  local file=${file//[^a-zA-Z0-9]/x}
  eval "${key}_${file}=${size}"
}

# ($1:file)
function logFileSizeBeforeStarting {
  addFileSizeToLog $1 "original"
}

# ($1:file)
function logFileSizeAfterImageAlpha {
  addFileSizeToLog $1 "imagealpha"
}

# ($1:file)
function logFileSizeAfterImageOptim {
  addFileSizeToLog $1 "imageoptim"
}

# ($1:file)
function logFileSizeAfterJpegMini {
  addFileSizeToLog $1 "jpegmini"
}
