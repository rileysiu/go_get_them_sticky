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

ADD https://raw.githubusercontent.com/star-39/moe-sticker-bot/master/tools/msb_emoji.py /usr/local/bin/msb_emoji.py
ADD https://raw.githubusercontent.com/star-39/moe-sticker-bot/master/tools/msb_kakao_decrypt.py /usr/local/bin/msb_kakao_decrypt.py
ADD https://raw.githubusercontent.com/star-39/moe-sticker-bot/master/tools/msb_rlottie.py /usr/local/bin/msb_rlottie.py

RUN chmod +x /usr/local/bin/msb_*.py

CMD ["/moe-sticker-bot"]
