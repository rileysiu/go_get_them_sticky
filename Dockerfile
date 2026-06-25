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

COPY --from=ghcr.io/star-39/moe-sticker-bot /moe-sticker-bot /moe-sticker-bot
COPY --from=ghcr.io/star-39/moe-sticker-bot /app/tools /app/tools

CMD ["/moe-sticker-bot"]
