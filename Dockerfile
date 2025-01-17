# 1. ベースイメージとしてPython 3.11（または任意のバージョン）を使用
FROM python:3.11-slim

# 2. 作業ディレクトリを設定
WORKDIR /app

# 3. ローカルのファイルをコンテナにコピー
COPY ./requirements.txt /app/requirements.txt
COPY ./main.py /app/main.py

# 4. 依存パッケージのインストール
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt

# 5. UvicornでFastAPIを実行
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]