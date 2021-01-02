# xsystems-pki

Configuration and scripts to initiate and manage a PKI

## Usage

```sh
Usage: pki (client|server|ca) PKI_DIR COMMON_NAME
```

### Examples

#### Create a CA

```sh
pki ca /run/media/kboes/data-03/keys/easy-rsa ca.xsystems.org
```

#### Create a Server

```sh
pki server /run/media/kboes/data-03/keys/easy-rsa 0.router.xsystems.org
```

#### Create a Client

```sh
pki client /run/media/kboes/data-03/keys/easy-rsa koenboes@xsystems.org
```
