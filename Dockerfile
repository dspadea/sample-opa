FROM alpine:latest as bundler

ADD sample-bundle /sample-bundle
RUN tar czvf /sample-bundle.tar.gz -C /sample-bundle /sample-bundle
RUN tar tvf /sample-bundle.tar.gz

FROM openpolicyagent/opa:0.59.0

# This is one of several ways to distribute policies.
# You can also: 
#   * use a volume mount or a config map,
#   * insert them with REST API calls.
#   * Serve them from a web server using the bundle service api
COPY --from=bundler /sample-bundle.tar.gz /bundles/sample-bundle.tar.gz

CMD ["run", "--server", "--log-level=debug", "--bundle", "/bundles/sample-bundle.tar.gz"]