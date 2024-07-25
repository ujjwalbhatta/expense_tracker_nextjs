/*
  Warnings:

  - The primary key for the `MonthHistory` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `day` on the `MonthHistory` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `month` on the `MonthHistory` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `year` on the `MonthHistory` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - The primary key for the `YearHistory` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `month` on the `YearHistory` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.
  - You are about to alter the column `year` on the `YearHistory` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_MonthHistory" (
    "userId" TEXT NOT NULL,
    "day" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "year" INTEGER NOT NULL,
    "income" REAL NOT NULL,
    "expense" REAL NOT NULL,

    PRIMARY KEY ("day", "month", "year", "userId")
);
INSERT INTO "new_MonthHistory" ("day", "expense", "income", "month", "userId", "year") SELECT "day", "expense", "income", "month", "userId", "year" FROM "MonthHistory";
DROP TABLE "MonthHistory";
ALTER TABLE "new_MonthHistory" RENAME TO "MonthHistory";
CREATE TABLE "new_YearHistory" (
    "userId" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "income" REAL NOT NULL,
    "expense" REAL NOT NULL,

    PRIMARY KEY ("year", "month", "userId")
);
INSERT INTO "new_YearHistory" ("expense", "income", "month", "userId", "year") SELECT "expense", "income", "month", "userId", "year" FROM "YearHistory";
DROP TABLE "YearHistory";
ALTER TABLE "new_YearHistory" RENAME TO "YearHistory";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
