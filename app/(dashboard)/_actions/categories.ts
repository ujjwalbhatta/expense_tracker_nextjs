"use server";

import prisma from "@/lib/prisma";
import { CreateCategorySchemaType } from "@/schema/category";
import { currentUser } from "@clerk/nextjs/server";
import { redirect } from "next/navigation";

export async function createCategory(form: CreateCategorySchemaType) {
  const user = await currentUser();

  if (!user) {
    redirect("/sign-in");
  }

  const { icon, name, type } = form;

  return await prisma.category.create({
    data: {
      icon,
      name,
      type,
      userId: user.id,
    },
  });
}
