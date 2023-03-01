a crude workaround for the fact that the Ingress controller I use (Contour) does not support redirects...even though its Load Balancing backend does.
inside of nginx.conf change the redirect line to the webpage you want to redirect to.

This just uses the alpine version of nginx and supplies a custom nginx.conf and repackages it.

Build with
`docker build -t <name>/nginx-redirect:<tag> .`

i.e
`docker build -t nivirx/nginx-redirect:1.0.0 .`

to import into a k8s cluster modify the chtm-redirect-deployment.yaml to your environment and run

`kubectl -n <namespace> apply -f chtm-redirect-deployment.yaml`

my enviroment is setup to automaticly generate Lets Encrypt Prod and Staging certs
with cert-manager

for the best results (and minimal editing) you k8s cluster should be setup as follows.

- MetalLB
- Project Contour (Contour + Envoy)
- JetStacks + cert-manager
