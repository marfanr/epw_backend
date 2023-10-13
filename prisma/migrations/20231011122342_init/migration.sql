/*
  Warnings:

  - You are about to drop the `StatusAnggota` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropIndex
DROP INDEX "StatusAnggota_name_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "StatusAnggota";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_AnggotaTimInjection" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nama_lengkap" TEXT NOT NULL,
    "id_team" INTEGER NOT NULL,
    "status" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "nim" TEXT NOT NULL,
    "nomor_telepon" TEXT NOT NULL,
    CONSTRAINT "AnggotaTimInjection_id_team_fkey" FOREIGN KEY ("id_team") REFERENCES "Injection" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_AnggotaTimInjection" ("email", "id", "id_team", "nama_lengkap", "nim", "nomor_telepon", "status") SELECT "email", "id", "id_team", "nama_lengkap", "nim", "nomor_telepon", "status" FROM "AnggotaTimInjection";
DROP TABLE "AnggotaTimInjection";
ALTER TABLE "new_AnggotaTimInjection" RENAME TO "AnggotaTimInjection";
CREATE UNIQUE INDEX "AnggotaTimInjection_nama_lengkap_key" ON "AnggotaTimInjection"("nama_lengkap");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
