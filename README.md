# codelambda.com

## Running Locally

The code is just static HTML and can be run with any web server. Due to its ubiquity, we prefer using the HTTP server
from Python's standard library. A script is included that you can run:

```console
$ chmod +x run.sh
$ ./run
```

Otherwise, you can also run it directly:

```console
$ python -m http.server -d ./src
```

Or use any web server that you prefer.

## Example files

The `examples` directory contains snippets from the original [Arsha](https://bootstrapmade.com/arsha-free-bootstrap-html-template-corporate/) template. It is moved out of the 
`src` directory to reduce the files being stored in S3, as well as prevent them from being accessed in the live website.
