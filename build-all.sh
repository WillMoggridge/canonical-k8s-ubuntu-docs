#!/usr/bin/env bash

if [ ! -d ./docs.ubuntu.com  ]; then
    git clone https://github.com/canonical-websites/docs.ubuntu.com.git docs.ubuntu.com
fi

docker build . --file $(pwd)/Dockerfile --tag willmoggridge/ubuntu-docs-test:base
docker build . --file $(pwd)/Dockerfile.ubuntu-core --tag willmoggridge/ubuntu-docs-test:ubuntu-core


#docker push willmoggridge/ubuntu-docs-test:base
#docker push willmoggridge/ubuntu-docs-test:ubuntu-core


# [core]=https://github.com/canonicalltd/ubuntu-core-docs.git
# [conjure-up]=https://github.com/canonicalltd/docs-conjure-up.git
# [documentation-builder]=https://github.com/canonicalltd/documentation-builder.git
# [phone]=https://github.com/ubuntudesign/phone-docs.git
# [maas]=https://github.com/canonicalltd/maas-docs.git
# [landscape]=https://github.com/canonicalltd/docs-landscape.git
