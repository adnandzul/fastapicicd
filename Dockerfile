# 1. Base Image: Mulai dari image resmi Python yang ringan
FROM python:3.11-slim

# 2. Set Direktori Kerja di dalam container
WORKDIR /code

# 3. Salin file dependensi dan install
# Ini dilakukan terpisah agar Docker bisa menggunakan cache layer jika requirements.txt tidak berubah
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 4. Salin semua kode aplikasi ke dalam container
COPY ./ /code/

# 5. Perintah yang akan dijalankan saat container启动
# Uvicorn akan berjalan di dalam container dan terekspos di port 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]