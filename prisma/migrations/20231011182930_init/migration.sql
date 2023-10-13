/*
  Warnings:

  - You are about to drop the column `link_berkas` on the `Injection` table. All the data in the column will be lost.
  - Added the required column `link_berkas_abstrak` to the `Injection` table without a default value. This is not possible if the table is not empty.
  - Added the required column `link_berkas_bukti` to the `Injection` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Injection" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nama_tim" TEXT NOT NULL,
    "asal_sekolah" TEXT NOT NULL,
    "type" INTEGER NOT NULL,
    "nama_pembimbing" TEXT NOT NULL,
    "no_telp_pembimbing" TEXT NOT NULL,
    "link_berkas_bukti" TEXT NOT NULL,
    "link_berkas_abstrak" TEXT NOT NULL,
    CONSTRAINT "Injection_type_fkey" FOREIGN KEY ("type") REFERENCES "TeamType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Injection" ("asal_sekolah", "id", "nama_pembimbing", "nama_tim", "no_telp_pembimbing", "type") SELECT "asal_sekolah", "id", "nama_pembimbing", "nama_tim", "no_telp_pembimbing", "type" FROM "Injection";
DROP TABLE "Injection";
ALTER TABLE "new_Injection" RENAME TO "Injection";
CREATE UNIQUE INDEX "Injection_nama_tim_key" ON "Injection"("nama_tim");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
