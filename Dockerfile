ARG kong_version
FROM kong:${kong_version} as base

USER root

ADD ./kong-plugin-consumer-referer-1.0-0.rockspec .
ADD ./src ./src

RUN luarocks make && luarocks pack kong-plugin-consumer-referer

RUN rm kong-plugin-consumer-referer-1.0-0.rockspec && rm -r src

FROM tianon/true

COPY --from=base ./kong-plugin-consumer-referer-1.0-0.all.rock /
