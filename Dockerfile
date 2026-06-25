FROM ghcr.io/star-39/moe-sticker-bot:latest AS source

FROM archlinux:latest

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
        imagemagick \
        libarchive \
        ffmpeg \
        curl \
        gifsicle \
        python \
        exiv2

COPY --from=source /moe-sticker-bot /moe-sticker-bot

CMD ["/moe-sticker-bot"]
