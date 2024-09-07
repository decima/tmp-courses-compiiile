FROM node:lts AS build
ARG LICENSE="0000000000"
ARG EMAIL="h.larget@gmail.com"

ENV COMPIIILE_PRO_LICENSE=${LICENSE}
ENV COMPIIILE_PRO_EMAIL=${EMAIL}

RUN npm install -g @compiiile/compiiile-pro @compiiile/compiiile-print

WORKDIR /app
COPY . .
CMD ["/usr/local/bin/compiiile-pro", "build"]

FROM httpd:2.4 AS runtime
COPY --from=build /app/.compiiile/dist /usr/local/apache2/htdocs/
EXPOSE 80
