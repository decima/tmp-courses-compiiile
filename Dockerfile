FROM node AS builder
ARG LICENSE="0000000000"
ARG EMAIL="h.larget@gmail.com"

ENV COMPIIILE_PRO_LICENSE=${LICENSE}
ENV COMPIIILE_PRO_EMAIL=${EMAIL}

RUN npm i --global @compiiile/compiiile-pro
WORKDIR /app
ADD . /app
RUN compiiile-pro build

FROM nginx AS runner
COPY --from=builder /app/.compiiile/dist /usr/share/nginx/html

