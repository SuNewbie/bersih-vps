#!/bin/bash

echo "🚨 Peringatan: Pembersihan dimulai..."

# 1. Hapus semua file & folder di direktori root (HOME)
echo "🗑️ Menghapus file dan folder di /root..."
rm -rf /root/* /root/.* 2>/dev/null

# 2. Bersihkan cache APT
echo "🧼 Membersihkan APT cache..."
apt clean
apt autoremove -y

# 3. Bersihkan log sistem lama
echo "🧾 Menghapus log lama..."
journalctl --vacuum-time=3d
rm -rf /var/log/*.gz /var/log/*.[0-9] /var/log/**/*.gz /var/log/**/*.[0-9] 2>/dev/null

# 4. Hapus file sampah dari temporary folders
echo "🧹 Membersihkan /tmp dan /var/tmp..."
rm -rf /tmp/* /var/tmp/*

# 5. Tampilkan sisa disk
echo "💾 Sisa kapasitas disk:"
df -h

echo "✅ Pembersihan selesai!"

