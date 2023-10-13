-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "namalengkap" TEXT,
    "password" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Verifikasi" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "status" BOOLEAN NOT NULL,
    CONSTRAINT "Verifikasi_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Injection" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nama_tim" TEXT NOT NULL,
    "asal_sekolah" TEXT NOT NULL,
    "type" INTEGER NOT NULL,
    "nama_pembimbing" TEXT NOT NULL,
    "no_telp_pembimbing" TEXT NOT NULL,
    "link_bukti_follow" TEXT NOT NULL,
    "link_bukti_upload_story" TEXT NOT NULL,
    CONSTRAINT "Injection_type_fkey" FOREIGN KEY ("type") REFERENCES "TeamType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "AnggotaTimInjection" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nama_lengkap" TEXT NOT NULL,
    "id_team" INTEGER NOT NULL,
    "status" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nim" TEXT NOT NULL,
    "nomor_telepon" TEXT NOT NULL,
    CONSTRAINT "AnggotaTimInjection_id_team_fkey" FOREIGN KEY ("id_team") REFERENCES "Injection" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "AnggotaTimInjection_status_fkey" FOREIGN KEY ("status") REFERENCES "StatusAnggota" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StatusAnggota" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "TeamType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Verifikasi_user_id_key" ON "Verifikasi"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Injection_nama_tim_key" ON "Injection"("nama_tim");

-- CreateIndex
CREATE UNIQUE INDEX "AnggotaTimInjection_nama_lengkap_key" ON "AnggotaTimInjection"("nama_lengkap");

-- CreateIndex
CREATE UNIQUE INDEX "StatusAnggota_name_key" ON "StatusAnggota"("name");

-- CreateIndex
CREATE UNIQUE INDEX "TeamType_name_key" ON "TeamType"("name");
