-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `namalengkap` VARCHAR(191) NULL,
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Verifikasi` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL,

    UNIQUE INDEX `Verifikasi_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Injection` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_tim` VARCHAR(191) NOT NULL,
    `asal_sekolah` VARCHAR(191) NOT NULL,
    `type` INTEGER NOT NULL,
    `nama_pembimbing` VARCHAR(191) NOT NULL,
    `no_telp_pembimbing` VARCHAR(191) NOT NULL,
    `link_berkas_bukti` VARCHAR(191) NOT NULL,
    `link_berkas_abstrak` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Injection_nama_tim_key`(`nama_tim`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AnggotaTimInjection` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_lengkap` VARCHAR(191) NOT NULL,
    `id_team` INTEGER NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `nim` VARCHAR(191) NOT NULL,
    `nomor_telepon` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TeamType` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `TeamType_name_key`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Verifikasi` ADD CONSTRAINT `Verifikasi_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Injection` ADD CONSTRAINT `Injection_type_fkey` FOREIGN KEY (`type`) REFERENCES `TeamType`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AnggotaTimInjection` ADD CONSTRAINT `AnggotaTimInjection_id_team_fkey` FOREIGN KEY (`id_team`) REFERENCES `Injection`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
